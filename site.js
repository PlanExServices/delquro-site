/* Delquro Labs — small progressive-enhancement script.
   No dependencies. Everything degrades gracefully without JS. */
(function () {
  "use strict";

  /* ---- Sticky topbar state ---- */
  var topbar = document.querySelector("[data-topbar]");
  if (topbar) {
    var onScroll = function () {
      topbar.classList.toggle("is-stuck", window.scrollY > 8);
    };
    onScroll();
    window.addEventListener("scroll", onScroll, { passive: true });
  }

  /* ---- Reveal on scroll ---- */
  var revealables = document.querySelectorAll("[data-reveal]");
  var reduceMotion =
    window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches;

  if (!revealables.length) {
    /* nothing to do */
  } else if (reduceMotion || !("IntersectionObserver" in window)) {
    Array.prototype.forEach.call(revealables, function (el) {
      el.classList.add("is-visible");
    });
  } else {
    var observer = new IntersectionObserver(
      function (entries) {
        entries.forEach(function (entry) {
          if (!entry.isIntersecting) return;
          var el = entry.target;
          var siblings = el.parentNode ? el.parentNode.children : [];
          var index = Array.prototype.indexOf.call(siblings, el);
          el.style.transitionDelay = Math.min(index, 4) * 70 + "ms";
          el.classList.add("is-visible");
          observer.unobserve(el);
        });
      },
      { rootMargin: "0px 0px -8% 0px", threshold: 0.08 }
    );

    Array.prototype.forEach.call(revealables, function (el) {
      observer.observe(el);
    });
  }

  /* ---- Product preview tabs ---- */
  var tabs = document.querySelectorAll("[data-preview-tab]");
  var cards = document.querySelectorAll("[data-preview-card]");

  function activate(tab) {
    var target = tab.getAttribute("data-preview-tab");

    Array.prototype.forEach.call(tabs, function (item) {
      var isActive = item === tab;
      item.classList.toggle("is-active", isActive);
      item.setAttribute("aria-selected", isActive ? "true" : "false");
      item.setAttribute("tabindex", isActive ? "0" : "-1");
    });

    Array.prototype.forEach.call(cards, function (card) {
      card.classList.toggle("is-active", card.getAttribute("data-preview-card") === target);
    });
  }

  Array.prototype.forEach.call(tabs, function (tab, i) {
    tab.setAttribute("tabindex", tab.classList.contains("is-active") ? "0" : "-1");

    tab.addEventListener("click", function () {
      activate(tab);
    });

    tab.addEventListener("keydown", function (event) {
      var next = null;
      if (event.key === "ArrowRight") next = tabs[(i + 1) % tabs.length];
      if (event.key === "ArrowLeft") next = tabs[(i - 1 + tabs.length) % tabs.length];
      if (!next) return;
      event.preventDefault();
      activate(next);
      next.focus();
    });
  });
})();

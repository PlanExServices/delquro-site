$ErrorActionPreference = "Stop"
$Project = "C:\Users\plane\delquro-site"
Set-Location $Project

$BackupRoot = Join-Path $Project ".site-backups"
if (-not (Test-Path $BackupRoot)) { New-Item -ItemType Directory -Path $BackupRoot | Out-Null }
$Stamp = Get-Date -Format "yyyyMMdd-HHmmss"
$BackupDir = Join-Path $BackupRoot $Stamp
New-Item -ItemType Directory -Path $BackupDir | Out-Null

if (Test-Path ".\index.html") { Copy-Item ".\index.html" (Join-Path $BackupDir "index.html") -Force }
if (Test-Path ".\commonwealth-connect.html") { Copy-Item ".\commonwealth-connect.html" (Join-Path $BackupDir "commonwealth-connect.html") -Force }
if (Test-Path ".\support.html") { Copy-Item ".\support.html" (Join-Path $BackupDir "support.html") -Force }
if (Test-Path ".\privacy.html") { Copy-Item ".\privacy.html" (Join-Path $BackupDir "privacy.html") -Force }
if (Test-Path ".\terms.html") { Copy-Item ".\terms.html" (Join-Path $BackupDir "terms.html") -Force }
if (Test-Path ".\style.css") { Copy-Item ".\style.css" (Join-Path $BackupDir "style.css") -Force }

$index_html = @'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Delquro Labs</title>
  <meta name="description" content="Focused software for communication, coordination, and operational clarity." />
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  <div class="site-shell">
    <header class="topbar">
  <div class="wrap topbar-inner">
    <a href="index.html" class="brand-lockup" aria-label="Delquro Labs home">
      <img src="logo.png" alt="Delquro Labs logo" class="brand-logo" />
      <div class="brand-text">
        <span class="brand-name">Del<span>Quro</span> Labs</span>
        <span class="brand-subtitle">Operational software, thoughtfully built</span>
      </div>
    </a>
    <nav class="nav" aria-label="Primary navigation">
      <a href="index.html">Home</a>
      <a href="commonwealth-connect.html">Commonwealth: Connect</a>
      <a href="support.html">Support</a>
    </nav>
  </div>
</header>
    <main>
      <section class="hero hero-home">
        <div class="wrap hero-grid">
          <div class="hero-copy">
            <span class="eyebrow">Independent software studio</span>
            <h1>Software for <span>real teams</span><br />that need clarity.</h1>
            <p class="hero-text">Delquro Labs creates focused software for communication, scheduling visibility, and dependable day-to-day operations.</p>
            <div class="hero-actions">
              <a href="commonwealth-connect.html" class="btn btn-primary">View Current Application</a>
              <a href="support.html" class="btn btn-secondary">Support</a>
            </div>
          </div>
          <div class="hero-visual" aria-hidden="true">
            <div class="product-stage">
              <div class="product-shell">
                <div class="shell-topbar"><span class="shell-dot"></span><span class="shell-dot"></span><span class="shell-dot"></span></div>
                <div class="shell-body">
                  <div class="shell-chip">Current application</div>
                  <div class="workflow-card">
                    <div class="workflow-title">Commonwealth: Connect</div>
                    <div class="line-stack"><span></span><span></span><span></span></div>
                  </div>
                  <div class="pill-row"><span>Team chat</span><span>Schedules</span><span>PTO</span><span>Huddles</span></div>
                  <div class="mini-grid">
                    <div class="mini-card"><div class="mini-title">Manager updates</div><div class="line-stack"><span></span><span></span></div></div>
                    <div class="mini-card mini-card-accent"><div class="mini-title">Daily workflow</div><div class="line-stack"><span></span><span></span></div></div>
                  </div>
                </div>
              </div>
              <div class="float-note note-left"><span class="chip">Focused build</span><p>Designed for daily operational use.</p></div>
              <div class="float-note note-right"><span class="chip">Clear workflow</span><p>Communication, visibility, and alignment.</p></div>
            </div>
          </div>
        </div>
      </section>
      <section id="focus" class="section">
        <div class="wrap">
          <div class="section-head"><span class="eyebrow">Focus</span><h2>Simple tools with real operational value</h2><p>The goal is not to build more software. The goal is to build software teams can rely on every day.</p></div>
          <div class="card-grid three-up">
            <article class="card"><div class="icon-dot"></div><h3>Clear Communication</h3><p>Reduce missed updates and improve alignment across active teams.</p></article>
            <article class="card"><div class="icon-dot"></div><h3>Practical Workflow Design</h3><p>Built around daily use instead of feature sprawl and unnecessary complexity.</p></article>
            <article class="card"><div class="icon-dot"></div><h3>Production-Ready Thinking</h3><p>Software designed to be stable, usable, and worth opening every day.</p></article>
          </div>
        </div>
      </section>
      <section class="section section-tight"><div class="wrap"><div class="feature-band"><div class="feature-copy"><span class="eyebrow">Featured application</span><h2>Commonwealth: Connect</h2><p>Built for veterinary hospital teams that need a centralized way to keep people informed, coordinated, and aligned.</p></div><div class="feature-actions"><a href="commonwealth-connect.html" class="btn btn-primary">Open Product Page</a><a href="privacy.html" class="btn btn-secondary">Privacy Policy</a></div></div></div></section>
      <section class="section section-tight"><div class="wrap"><div class="split-panel"><div><span class="eyebrow">Built by Delquro Labs</span><h2>Focused company. Focused products.</h2></div><p>Delquro Labs is centered on a simple principle: software should make the workday easier, clearer, and more coordinated — not more cluttered.</p></div></div></section>
    </main>
    <footer class="footer">
  <div class="wrap footer-inner">
    <div>
      <div class="footer-brand">Delquro Labs</div>
      <p class="footer-copy">Focused software for communication, coordination, and operational clarity.</p>
    </div>
    <div class="footer-links">
      <a href="commonwealth-connect.html">Commonwealth: Connect</a>
      <a href="support.html">Support</a>
      <a href="privacy.html">Privacy Policy</a>
      <a href="terms.html">Terms of Service</a>
    </div>
  </div>
  <div class="wrap footer-bottom">
    <span>© 2026 Delquro Labs</span>
    <span>info@delquro.com</span>
  </div>
</footer>
  </div>
</body>
</html>
'@
Set-Content -Path ".\index.html" -Value $index_html -Encoding UTF8

$commonwealth_connect_html = @'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Commonwealth: Connect | Delquro Labs</title>
  <meta name="description" content="Communication and workflow software for veterinary hospital teams." />
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  <div class="site-shell">
    <header class="topbar">
  <div class="wrap topbar-inner">
    <a href="index.html" class="brand-lockup" aria-label="Delquro Labs home">
      <img src="logo.png" alt="Delquro Labs logo" class="brand-logo" />
      <div class="brand-text">
        <span class="brand-name">Del<span>Quro</span> Labs</span>
        <span class="brand-subtitle">Operational software, thoughtfully built</span>
      </div>
    </a>
    <nav class="nav" aria-label="Primary navigation">
      <a href="index.html">Home</a>
      <a href="commonwealth-connect.html">Commonwealth: Connect</a>
      <a href="support.html">Support</a>
    </nav>
  </div>
</header>
    <main>
      <section class="hero">
        <div class="wrap hero-grid">
          <div class="hero-copy"><span class="eyebrow">Current application</span><h1>Commonwealth: <span>Connect</span></h1><p class="hero-text">A communication and workflow platform for veterinary hospital teams, focused on visibility, coordination, and dependable daily use.</p><div class="hero-actions"><a class="btn btn-primary" href="support.html">Support</a><a class="btn btn-secondary" href="privacy.html">Privacy Policy</a></div></div>
          <div class="hero-visual"><div class="product-stage"><div class="product-shell"><div class="shell-topbar"><span class="shell-dot"></span><span class="shell-dot"></span><span class="shell-dot"></span></div><div class="shell-body"><div class="shell-chip">Designed for teams</div><div class="workflow-card"><div class="workflow-title">Veterinary hospital operations</div><div class="line-stack"><span></span><span></span><span></span></div></div><div class="pill-row"><span>Messages</span><span>Schedules</span><span>PTO</span><span>Manager updates</span></div></div></div></div></div>
        </div>
      </section>
      <section class="section"><div class="wrap"><div class="section-head"><span class="eyebrow">What it supports</span><h2>Built around everyday team operations</h2><p>Commonwealth: Connect is designed to reduce communication gaps and create a more visible, coordinated workflow across the hospital team.</p></div><div class="card-grid three-up"><article class="card"><div class="icon-dot"></div><h3>Communication</h3><p>Team-wide communication in a centralized, work-focused environment.</p></article><article class="card"><div class="icon-dot"></div><h3>Schedule Visibility</h3><p>Shared access to posted schedule updates and key operational information.</p></article><article class="card"><div class="icon-dot"></div><h3>Workflow Alignment</h3><p>Support for PTO awareness, manager updates, and daily coordination.</p></article></div></div></section>
      <section class="section section-tight"><div class="wrap"><div class="feature-band"><div class="feature-copy"><span class="eyebrow">Built by Delquro Labs</span><h2>A focused operational product</h2><p>Straightforward, useful, and designed for real working teams.</p></div><div class="feature-actions"><a href="index.html" class="btn btn-secondary">Back to Delquro Labs</a><a href="terms.html" class="btn btn-primary">Terms of Service</a></div></div></div></section>
    </main>
    <footer class="footer">
  <div class="wrap footer-inner">
    <div>
      <div class="footer-brand">Delquro Labs</div>
      <p class="footer-copy">Focused software for communication, coordination, and operational clarity.</p>
    </div>
    <div class="footer-links">
      <a href="commonwealth-connect.html">Commonwealth: Connect</a>
      <a href="support.html">Support</a>
      <a href="privacy.html">Privacy Policy</a>
      <a href="terms.html">Terms of Service</a>
    </div>
  </div>
  <div class="wrap footer-bottom">
    <span>© 2026 Delquro Labs</span>
    <span>info@delquro.com</span>
  </div>
</footer>
  </div>
</body>
</html>
'@
Set-Content -Path ".\commonwealth-connect.html" -Value $commonwealth_connect_html -Encoding UTF8

$support_html = @'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Support | Delquro Labs</title>
  <meta name="description" content="Support for Delquro Labs software." />
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  <div class="site-shell">
    <header class="topbar">
  <div class="wrap topbar-inner">
    <a href="index.html" class="brand-lockup" aria-label="Delquro Labs home">
      <img src="logo.png" alt="Delquro Labs logo" class="brand-logo" />
      <div class="brand-text">
        <span class="brand-name">Del<span>Quro</span> Labs</span>
        <span class="brand-subtitle">Operational software, thoughtfully built</span>
      </div>
    </a>
    <nav class="nav" aria-label="Primary navigation">
      <a href="index.html">Home</a>
      <a href="commonwealth-connect.html">Commonwealth: Connect</a>
      <a href="support.html">Support</a>
    </nav>
  </div>
</header>
    <main>
      <section class="content-panel">
        <span class="eyebrow">Support</span>
        <h1>Support</h1>
        <p>For help with Delquro Labs software or Commonwealth: Connect, contact support using the email below.</p>
        <h2>Contact</h2>
        <p>Email: <a href="mailto:info@delquro.com">info@delquro.com</a></p>
        <h2>Helpful details to include</h2>
        <ul><li>Which application you are using</li><li>What device or browser you are using</li><li>What happened and what you expected to happen</li><li>Any screenshots that help explain the issue</li></ul>
      </section>
    </main>
    <footer class="footer">
  <div class="wrap footer-inner">
    <div>
      <div class="footer-brand">Delquro Labs</div>
      <p class="footer-copy">Focused software for communication, coordination, and operational clarity.</p>
    </div>
    <div class="footer-links">
      <a href="commonwealth-connect.html">Commonwealth: Connect</a>
      <a href="support.html">Support</a>
      <a href="privacy.html">Privacy Policy</a>
      <a href="terms.html">Terms of Service</a>
    </div>
  </div>
  <div class="wrap footer-bottom">
    <span>© 2026 Delquro Labs</span>
    <span>info@delquro.com</span>
  </div>
</footer>
  </div>
</body>
</html>
'@
Set-Content -Path ".\support.html" -Value $support_html -Encoding UTF8

$privacy_html = @'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Privacy Policy | Delquro Labs</title>
  <meta name="description" content="Privacy information for Delquro Labs software." />
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  <div class="site-shell">
    <header class="topbar">
  <div class="wrap topbar-inner">
    <a href="index.html" class="brand-lockup" aria-label="Delquro Labs home">
      <img src="logo.png" alt="Delquro Labs logo" class="brand-logo" />
      <div class="brand-text">
        <span class="brand-name">Del<span>Quro</span> Labs</span>
        <span class="brand-subtitle">Operational software, thoughtfully built</span>
      </div>
    </a>
    <nav class="nav" aria-label="Primary navigation">
      <a href="index.html">Home</a>
      <a href="commonwealth-connect.html">Commonwealth: Connect</a>
      <a href="support.html">Support</a>
    </nav>
  </div>
</header>
    <main>
      <section class="content-panel">
        <span class="eyebrow">Privacy</span>
        <h1>Privacy Policy</h1>
        <p>This beta privacy page describes the general privacy posture for Delquro Labs software. Replace this page with final legal language before production launch.</p>
        <h2>Information handled</h2>
        <p>Applications may handle account information, team communication, schedule-related information, and operational content needed to provide the service.</p>
        <h2>Use of information</h2>
        <p>Information is used to operate, support, secure, and improve the application experience.</p>
        <h2>Contact</h2>
        <p>Questions can be sent to <a href="mailto:info@delquro.com">info@delquro.com</a>.</p>
      </section>
    </main>
    <footer class="footer">
  <div class="wrap footer-inner">
    <div>
      <div class="footer-brand">Delquro Labs</div>
      <p class="footer-copy">Focused software for communication, coordination, and operational clarity.</p>
    </div>
    <div class="footer-links">
      <a href="commonwealth-connect.html">Commonwealth: Connect</a>
      <a href="support.html">Support</a>
      <a href="privacy.html">Privacy Policy</a>
      <a href="terms.html">Terms of Service</a>
    </div>
  </div>
  <div class="wrap footer-bottom">
    <span>© 2026 Delquro Labs</span>
    <span>info@delquro.com</span>
  </div>
</footer>
  </div>
</body>
</html>
'@
Set-Content -Path ".\privacy.html" -Value $privacy_html -Encoding UTF8

$terms_html = @'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Terms of Service | Delquro Labs</title>
  <meta name="description" content="Terms of service for Delquro Labs software." />
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  <div class="site-shell">
    <header class="topbar">
  <div class="wrap topbar-inner">
    <a href="index.html" class="brand-lockup" aria-label="Delquro Labs home">
      <img src="logo.png" alt="Delquro Labs logo" class="brand-logo" />
      <div class="brand-text">
        <span class="brand-name">Del<span>Quro</span> Labs</span>
        <span class="brand-subtitle">Operational software, thoughtfully built</span>
      </div>
    </a>
    <nav class="nav" aria-label="Primary navigation">
      <a href="index.html">Home</a>
      <a href="commonwealth-connect.html">Commonwealth: Connect</a>
      <a href="support.html">Support</a>
    </nav>
  </div>
</header>
    <main>
      <section class="content-panel">
        <span class="eyebrow">Terms</span>
        <h1>Terms of Service</h1>
        <p>This beta terms page provides placeholder terms for review. Replace this page with final legal language before production launch.</p>
        <h2>Use of service</h2>
        <p>Users should use Delquro Labs software for authorized operational and communication purposes only.</p>
        <h2>Availability</h2>
        <p>Beta software may change as features are refined, tested, and prepared for production use.</p>
        <h2>Contact</h2>
        <p>Questions can be sent to <a href="mailto:info@delquro.com">info@delquro.com</a>.</p>
      </section>
    </main>
    <footer class="footer">
  <div class="wrap footer-inner">
    <div>
      <div class="footer-brand">Delquro Labs</div>
      <p class="footer-copy">Focused software for communication, coordination, and operational clarity.</p>
    </div>
    <div class="footer-links">
      <a href="commonwealth-connect.html">Commonwealth: Connect</a>
      <a href="support.html">Support</a>
      <a href="privacy.html">Privacy Policy</a>
      <a href="terms.html">Terms of Service</a>
    </div>
  </div>
  <div class="wrap footer-bottom">
    <span>© 2026 Delquro Labs</span>
    <span>info@delquro.com</span>
  </div>
</footer>
  </div>
</body>
</html>
'@
Set-Content -Path ".\terms.html" -Value $terms_html -Encoding UTF8

$style_css = @'
:root {
  color-scheme: dark light;
  --bg: #12161d;
  --bg-2: #171b22;
  --surface: rgba(255, 255, 255, 0.065);
  --surface-strong: rgba(255, 255, 255, 0.11);
  --border: rgba(255, 255, 255, 0.095);
  --text: #f4f7fb;
  --muted: #a9b4c3;
  --accent: #527e69;
  --accent-bright: #739f8a;
  --shadow: 0 28px 88px rgba(0, 0, 0, 0.34);
  --radius: 26px;
  --radius-sm: 18px;
  --wrap: 1120px;
  --topbar-bg: rgba(18, 22, 29, 0.74);
  --secondary-button-bg: rgba(255,255,255,0.045);
  --footer-border: rgba(255,255,255,0.06);
}

@media (prefers-color-scheme: light) {
  :root {
    --bg: #eef4f1;
    --bg-2: #f7faf8;
    --surface: rgba(255,255,255,0.9);
    --surface-strong: rgba(255,255,255,0.98);
    --border: rgba(24,34,43,0.085);
    --text: #17212a;
    --muted: #5e6c79;
    --accent: #628c78;
    --accent-bright: #85ae9b;
    --shadow: 0 22px 60px rgba(25,37,46,0.10);
    --topbar-bg: rgba(247,250,248,0.82);
    --secondary-button-bg: rgba(24,34,43,0.035);
    --footer-border: rgba(24,34,43,0.08);
  }
}

* { box-sizing: border-box; }
html { scroll-behavior: smooth; }
body {
  margin: 0;
  color: var(--text);
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Inter, Arial, sans-serif;
  line-height: 1.6;
  background:
    radial-gradient(circle at 10% 8%, rgba(82,126,105,0.18), transparent 0 24%),
    radial-gradient(circle at 86% 18%, rgba(115,159,138,0.13), transparent 0 22%),
    linear-gradient(180deg, var(--bg) 0%, var(--bg-2) 100%);
}
a { color: inherit; text-decoration: none; }
p { margin: 0; }
img { display: block; max-width: 100%; }
.wrap { width: min(var(--wrap), calc(100% - 40px)); margin: 0 auto; }
.site-shell { min-height: 100vh; }

.topbar {
  position: sticky;
  top: 0;
  z-index: 30;
  border-bottom: 1px solid var(--footer-border);
  background: var(--topbar-bg);
  backdrop-filter: blur(16px);
}
.topbar-inner {
  min-height: 82px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 24px;
}
.brand-lockup { display: flex; align-items: center; gap: 14px; min-width: 0; }
.brand-logo {
  width: 56px;
  height: 56px;
  object-fit: contain;
  border-radius: 16px;
  filter: drop-shadow(0 0 22px rgba(82,126,105,0.28));
}
.brand-name { display: block; font-weight: 760; letter-spacing: 0.01em; }
.brand-name span { color: var(--accent-bright); }
.brand-subtitle { display: block; color: var(--muted); font-size: 0.82rem; margin-top: 3px; }
.nav { display: flex; align-items: center; gap: 22px; flex-wrap: wrap; color: var(--muted); font-size: 0.95rem; }
.nav a:hover { color: var(--text); }

.hero { position: relative; overflow: hidden; padding: 92px 0 58px; }
.hero::before,
.hero::after {
  content: "";
  position: absolute;
  pointer-events: none;
  border-radius: 999px;
  filter: blur(2px);
}
.hero::before { width: 360px; height: 360px; top: -150px; left: -120px; background: radial-gradient(circle, rgba(82,126,105,0.16), transparent 72%); }
.hero::after { width: 340px; height: 340px; right: -130px; bottom: 30px; background: radial-gradient(circle, rgba(115,159,138,0.10), transparent 72%); }
.hero-grid { position: relative; display: grid; grid-template-columns: minmax(0, 1fr) minmax(350px, 0.95fr); gap: 56px; align-items: center; }
.eyebrow { display: inline-flex; margin-bottom: 16px; color: var(--accent-bright); text-transform: uppercase; letter-spacing: 0.14em; font-size: 0.78rem; font-weight: 780; }
.hero h1 { margin: 0; max-width: 10ch; font-size: clamp(3.25rem, 5.7vw, 5.75rem); line-height: 0.92; letter-spacing: -0.06em; }
.hero h1 span, .accent { color: var(--accent-bright); }
.hero-text { max-width: 36rem; margin-top: 22px; color: var(--muted); font-size: 1.08rem; }
.hero-actions { margin-top: 32px; display: flex; gap: 14px; flex-wrap: wrap; }
.btn { min-height: 50px; padding: 0 18px; display: inline-flex; align-items: center; justify-content: center; border-radius: 999px; font-weight: 760; font-size: 0.95rem; transition: transform 0.18s ease, border-color 0.18s ease, box-shadow 0.18s ease; }
.btn:hover { transform: translateY(-1px); }
.btn-primary { color: #10231d; background: linear-gradient(180deg, var(--accent-bright), var(--accent)); box-shadow: 0 18px 36px rgba(82,126,105,0.26); }
.btn-secondary { border: 1px solid var(--border); background: var(--secondary-button-bg); color: var(--text); }
.btn-secondary:hover { border-color: rgba(115,159,138,0.42); }

.product-stage { position: relative; width: min(100%, 530px); margin: 0 auto; }
.product-shell, .card, .feature-band, .split-panel, .content-panel {
  background: linear-gradient(180deg, rgba(255,255,255,0.086), rgba(255,255,255,0.036));
  border: 1px solid var(--border);
  border-radius: var(--radius);
  box-shadow: var(--shadow);
}
.product-shell { overflow: hidden; transform: perspective(1100px) rotateY(-6deg) rotateX(1deg); }
.product-shell::before { content: ""; position: absolute; width: 280px; height: 280px; top: -130px; right: -120px; background: radial-gradient(circle, rgba(115,159,138,0.22), transparent 72%); }
.shell-topbar { display: flex; gap: 8px; padding: 16px 18px 0; }
.shell-dot { width: 10px; height: 10px; border-radius: 50%; background: rgba(255,255,255,0.24); }
.shell-body { position: relative; padding: 18px; }
.chip, .shell-chip { display: inline-flex; min-height: 34px; align-items: center; padding: 0 12px; border-radius: 999px; background: rgba(82,126,105,0.16); border: 1px solid rgba(115,159,138,0.28); color: var(--accent-bright); font-size: 0.82rem; font-weight: 760; letter-spacing: 0.04em; }
.workflow-card { margin-top: 16px; border-radius: var(--radius-sm); border: 1px solid var(--border); background: rgba(255,255,255,0.048); padding: 18px; }
.workflow-title { font-weight: 780; letter-spacing: -0.01em; }
.line-stack { display: grid; gap: 8px; margin-top: 14px; }
.line-stack span { display: block; height: 10px; border-radius: 999px; background: rgba(255,255,255,0.13); }
.line-stack span:nth-child(1) { width: 88%; }
.line-stack span:nth-child(2) { width: 74%; }
.line-stack span:nth-child(3) { width: 62%; }
.pill-row { margin-top: 14px; display: flex; gap: 10px; flex-wrap: wrap; }
.pill-row span { min-height: 34px; padding: 0 12px; display: inline-flex; align-items: center; border: 1px solid var(--border); background: rgba(255,255,255,0.052); border-radius: 999px; font-size: 0.88rem; }
.mini-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 14px; margin-top: 14px; }
.mini-card { padding: 16px; border-radius: var(--radius-sm); border: 1px solid var(--border); background: rgba(255,255,255,0.052); }
.mini-card-accent { background: linear-gradient(180deg, rgba(82,126,105,0.18), rgba(255,255,255,0.052)); }
.mini-title { font-weight: 760; font-size: 0.94rem; }
.float-note { position: absolute; max-width: 190px; padding: 14px 16px; border: 1px solid var(--border); border-radius: var(--radius-sm); background: rgba(255,255,255,0.075); backdrop-filter: blur(12px); box-shadow: var(--shadow); }
.float-note p { margin-top: 10px; color: var(--muted); font-size: 0.9rem; }
.note-left { left: -8px; bottom: 44px; }
.note-right { right: 2px; top: 28px; }

.section { padding: 46px 0; }
.section-tight { padding-top: 18px; }
.section-head { max-width: 760px; margin-bottom: 28px; }
.section h2, .feature-band h2, .split-panel h2, .content-panel h1, .content-panel h2 { margin: 0 0 10px; font-size: clamp(1.65rem, 3vw, 2.35rem); line-height: 1.08; letter-spacing: -0.03em; }
.section-head p, .card p, .feature-band p, .split-panel p, .content-panel p, .content-panel li { color: var(--muted); }
.card-grid { display: grid; gap: 18px; }
.three-up { grid-template-columns: repeat(3, minmax(0, 1fr)); }
.card { padding: 28px; position: relative; overflow: hidden; }
.card::after { content: ""; position: absolute; width: 110px; height: 110px; right: -30px; bottom: -30px; border-radius: 999px; background: radial-gradient(circle, rgba(115,159,138,0.10), transparent 70%); }
.icon-dot { width: 12px; height: 12px; border-radius: 999px; background: linear-gradient(180deg, var(--accent-bright), var(--accent)); box-shadow: 0 0 18px rgba(82,126,105,0.48); margin-bottom: 16px; }
.card h3 { margin: 0 0 8px; font-size: 1.08rem; letter-spacing: -0.01em; }
.feature-band { padding: 30px; display: flex; align-items: center; justify-content: space-between; gap: 26px; }
.feature-copy { max-width: 640px; }
.feature-actions { display: flex; gap: 12px; flex-wrap: wrap; justify-content: flex-end; }
.split-panel { padding: 30px; display: grid; grid-template-columns: 0.95fr 1.05fr; gap: 26px; align-items: center; }
.content-panel { margin: 52px auto; padding: 34px; max-width: 900px; }
.content-panel h1 { font-size: clamp(2.1rem, 4vw, 3.4rem); }
.content-panel h2 { margin-top: 28px; }
.content-panel ul { padding-left: 22px; }
.content-panel li + li { margin-top: 8px; }
.footer { padding: 58px 0 24px; }
.footer-inner { border-top: 1px solid var(--footer-border); padding-top: 20px; display: flex; justify-content: space-between; gap: 28px; }
.footer-brand { font-weight: 780; margin-bottom: 8px; }
.footer-copy { max-width: 390px; color: var(--muted); }
.footer-links { display: grid; gap: 8px; text-align: right; }
.footer-links a { color: var(--muted); }
.footer-links a:hover { color: var(--text); }
.footer-bottom { margin-top: 18px; padding-top: 18px; border-top: 1px solid var(--footer-border); color: var(--muted); display: flex; justify-content: space-between; gap: 16px; font-size: 0.92rem; }

@media (max-width: 1100px) {
  .hero-grid { grid-template-columns: minmax(0,1fr) minmax(320px,0.9fr); gap: 38px; }
  .hero h1 { font-size: clamp(2.8rem, 5vw, 4.9rem); }
  .product-stage { width: min(100%, 480px); }
  .hero-visual { min-height: 420px; }
}
@media (max-width: 980px) {
  .hero { padding-top: 76px; }
  .hero-grid, .three-up, .feature-band, .split-panel, .footer-inner, .footer-bottom { grid-template-columns: 1fr; flex-direction: column; align-items: flex-start; }
  .hero h1 { max-width: 9.4ch; font-size: clamp(2.5rem, 6vw, 3.9rem); }
  .hero-visual { min-height: auto; padding-top: 8px; }
  .product-shell { transform: none; }
  .float-note { position: relative; max-width: 100%; margin-top: 14px; left: auto; right: auto; top: auto; bottom: auto; }
  .feature-actions, .footer-links { justify-content: flex-start; text-align: left; }
}
@media (max-width: 720px) {
  .wrap { width: min(var(--wrap), calc(100% - 28px)); }
  .topbar-inner { flex-direction: column; align-items: flex-start; padding: 14px 0; }
  .nav { gap: 14px; }
  .hero { padding-top: 58px; padding-bottom: 34px; }
  .hero h1 { max-width: 8.4ch; font-size: clamp(2.35rem, 12vw, 3.75rem); line-height: 0.96; }
  .hero-text { font-size: 1rem; }
  .hero-actions, .feature-actions { width: 100%; }
  .btn { width: 100%; }
  .mini-grid { grid-template-columns: 1fr; }
  .shell-body { padding: 14px; }
  .brand-logo { width: 52px; height: 52px; }
}
'@
Set-Content -Path ".\style.css" -Value $style_css -Encoding UTF8

Write-Host "Full beta website files written locally." -ForegroundColor Green
Write-Host "Backup saved to: $BackupDir" -ForegroundColor Yellow
Write-Host "Review locally before committing." -ForegroundColor Cyan
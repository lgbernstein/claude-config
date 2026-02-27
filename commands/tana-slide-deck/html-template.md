# HTML Template

Base template for all slide presentations. Single self-contained HTML file with horizontal navigation, system theme support, color picker, slide preview, and PDF export.

## Full Template

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{TITLE}}</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
:root{--bg:#f8f6f3;--bg2:#fffefa;--c1:#1a1816;--c2:#6b635a;--acc:#0066ff;--glow:rgba(0,102,255,.1);--hov:rgba(26,24,22,.05);--brd:rgba(26,24,22,.08);--font:'Outfit',system-ui,sans-serif;--pad:clamp(2rem,6vw,5rem);--ease:cubic-bezier(0,0,.2,1)}
@media(prefers-color-scheme:dark){:root{--bg:#141210;--bg2:#1c1a17;--c1:#f5f3f0;--c2:#9a928a;--hov:rgba(245,243,240,.06);--brd:rgba(245,243,240,.1)}}
*,*::before,*::after{margin:0;padding:0;box-sizing:border-box}
html,body{overflow-x:hidden}
body{font-family:var(--font);background:var(--bg);color:var(--c1);line-height:1.6;overflow-y:hidden;-webkit-font-smoothing:antialiased}
.sc{display:flex;height:100dvh;transition:transform .18s var(--ease);will-change:transform}
.s{min-width:100vw;width:100vw;height:100dvh;padding:var(--pad);display:flex;flex-direction:column;justify-content:center;background:var(--bg2);flex-shrink:0;overflow:hidden;position:relative}
.s>div{max-width:900px;width:100%;margin:0 auto}

/* Title slide - accent bar left */
.st{display:grid;grid-template-columns:auto 1fr;align-items:center;gap:clamp(1.5rem,4vw,2.5rem)}
.st::before{content:'';width:clamp(4px,.8vw,6px);height:clamp(70px,18vh,160px);background:var(--acc);border-radius:3px}
.st h1{font-size:clamp(2.5rem,7vw,4.5rem);font-weight:700;line-height:1.08;letter-spacing:-.025em}
.st .sub{font-size:clamp(1.1rem,2.25vw,1.35rem);color:var(--c2);margin-top:.75rem;font-weight:400;max-width:40ch}

/* Statement slide - gradient bg, accent words */
.ss{text-align:center;align-items:center;background:linear-gradient(180deg,var(--bg2) 0%,var(--bg) 100%)}
.ss h2{font-size:clamp(1.75rem,4.5vw,3rem);font-weight:600;line-height:1.3;max-width:22ch;margin:0 auto}
.ss em{font-style:normal;color:var(--acc)}

/* Quote slide - large quote with citation below */
.sq{background:var(--bg)}
.sq blockquote{font-size:clamp(1.75rem,4vw,2.75rem);font-weight:500;line-height:1.35;color:var(--c1);position:relative;padding-left:clamp(2rem,5vw,3.5rem)}
.sq blockquote::before{content:'"';position:absolute;left:0;top:-.1em;font-size:clamp(3rem,8vw,5rem);font-weight:700;color:var(--acc);line-height:1;opacity:.3}
.sq cite{display:block;margin-top:1.5rem;padding-left:clamp(2rem,5vw,3.5rem);font-size:1rem;color:var(--c2);font-weight:500}

/* Typography */
h2{font-size:clamp(1.5rem,3.5vw,2.25rem);font-weight:600;line-height:1.25;margin-bottom:1.25rem;letter-spacing:-.015em}
h3{font-size:1.1rem;font-weight:600;line-height:1.3;margin-bottom:.4rem}
p{font-size:clamp(1.05rem,1.8vw,1.2rem);color:var(--c2);max-width:50ch;margin-bottom:.9rem}
strong{color:var(--c1);font-weight:600}

/* Date marker - pill */
.dt{display:inline-flex;align-items:center;font-size:.8rem;font-weight:600;color:var(--acc);background:var(--glow);padding:.4rem .8rem;border-radius:2rem;margin-bottom:1.25rem;letter-spacing:.02em}

/* Lists */
ul{list-style:none;margin-top:1.5rem}
li{font-size:clamp(1.05rem,1.8vw,1.2rem);color:var(--c2);padding-left:1.5rem;position:relative;margin-bottom:1rem;max-width:48ch}
li::before{content:'';position:absolute;left:0;top:.55em;width:6px;height:6px;background:var(--acc);border-radius:50%}
li strong{color:var(--c1)}

/* Timeline - horizontal */
.tl{display:grid;grid-template-columns:repeat(4,1fr);gap:1rem;margin-top:2rem;position:relative}
.tl::before{content:'';position:absolute;top:1.1rem;left:1rem;right:1rem;height:2px;background:var(--brd)}
.ti{text-align:center;position:relative;padding-top:2.75rem}
.ti::before{content:'';position:absolute;top:0;left:50%;transform:translateX(-50%);width:2.25rem;height:2.25rem;background:var(--bg2);border:2px solid var(--acc);border-radius:50%;z-index:1}
.ti::after{content:attr(data-n);position:absolute;top:.5rem;left:50%;transform:translateX(-50%);font-size:.9rem;font-weight:600;color:var(--acc);z-index:2}
.ti h3{font-size:1.05rem;margin-bottom:.25rem}
.ti p{font-size:1rem;margin:0;color:var(--c2)}

/* Cards - staggered, left border */
.g3{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:1.25rem;margin-top:1.75rem}
.g3>div{padding:1.4rem;background:var(--bg);border-radius:10px;border-left:3px solid var(--acc)}
.g3>div:nth-child(2){transform:translateY(.5rem)}
.g3 h3{font-size:1.05rem;margin-bottom:.5rem}
.g3 p{font-size:1rem;margin:0;color:var(--c2)}

/* Two columns - with faded icons */
.cols{display:grid;grid-template-columns:repeat(auto-fit,minmax(260px,1fr));gap:1.25rem;margin-top:1.5rem}
.cols>div{padding:1.5rem;background:var(--bg);border-radius:10px;position:relative;overflow:hidden}
.cols>div::before{content:attr(data-icon);position:absolute;top:-.6rem;right:-.2rem;font-size:5rem;opacity:.06;font-weight:700}
.cols h3{font-size:1.1rem;margin-bottom:.5rem;display:flex;align-items:center;gap:.5rem}
.cols h3::before{content:'';width:8px;height:8px;background:var(--acc);border-radius:50%}
.cols p{font-size:1.025rem;margin:0;color:var(--c2)}

/* Animations */
.r{opacity:0;transform:translateY(14px);transition:opacity .28s var(--ease),transform .28s var(--ease)}
.s.v .r{opacity:1;transform:none}
.r:nth-child(2){transition-delay:.05s}.r:nth-child(3){transition-delay:.1s}.r:nth-child(4){transition-delay:.15s}.r:nth-child(5){transition-delay:.2s}.r:nth-child(6){transition-delay:.25s}

/* Progress & UI */
#p{position:fixed;top:0;left:0;height:2px;background:var(--acc);transition:width .18s;z-index:100}
.bb{position:fixed;bottom:0;left:0;right:0;display:flex;justify-content:space-between;align-items:center;padding:1.2rem 1.6rem;pointer-events:none}
.bb>*{pointer-events:auto}
.bl,.br{display:flex;align-items:center;gap:.7rem}
.btn{font-size:.65rem;font-weight:600;text-transform:uppercase;letter-spacing:.08em;color:var(--c2);background:0 0;border:0;font-family:inherit;cursor:pointer;padding:.45rem .65rem;transition:color .15s;user-select:none}
.btn:hover{color:var(--c1)}
.nh{font-size:.6rem;font-weight:500;letter-spacing:.06em;color:var(--c2);opacity:.4}
.tb{font-size:.55rem;font-weight:600;text-transform:uppercase;letter-spacing:.1em;color:var(--c2);opacity:.3;text-decoration:none;transition:opacity .15s}
.tb:hover{opacity:.55}
.cp{position:relative;display:flex;align-items:center}
#cpb{width:14px;height:14px;border-radius:3px;background:var(--acc);border:0;cursor:pointer;transition:opacity .15s}
#cpb:hover{opacity:.75}
#cpd{position:absolute;bottom:calc(100% + .6rem);left:0;background:var(--bg2);border:1px solid var(--brd);border-radius:6px;padding:.5rem;display:none;grid-template-columns:repeat(4,1fr);gap:.4rem;box-shadow:0 4px 16px rgba(0,0,0,.08);z-index:50}
#cpd.a{display:grid}
.cs{width:18px;height:18px;border-radius:50%;border:0;cursor:pointer;transition:transform .1s}
.cs:hover{transform:scale(1.1)}
.cs.sel{box-shadow:0 0 0 2px var(--bg2),0 0 0 3px currentColor}

/* Preview */
#po{position:fixed;inset:0;background:var(--c1);z-index:200;display:none;place-items:center;padding:1.5rem;overflow-y:auto}
#po.a{display:grid}
#pg{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:.8rem;max-width:1200px;width:100%}
.pi{aspect-ratio:16/9;border-radius:6px;overflow:hidden;cursor:pointer;position:relative;transition:opacity .15s;background:var(--bg2)}
.pi:hover{opacity:.85}
.pi.cur{box-shadow:inset 0 0 0 2px var(--acc)}
.pii{width:1920px;height:1080px;transform:scale(.12);transform-origin:top left;pointer-events:none;background:var(--bg2)}
.pii .s{background:var(--bg2)!important}
.pii .r{opacity:1!important;transform:none!important}
.pin{position:absolute;bottom:.4rem;right:.4rem;font-size:.55rem;font-weight:600;letter-spacing:.08em;background:var(--c1);color:var(--bg2);padding:.2rem .4rem;border-radius:3px}
#pc{position:fixed;top:1.2rem;right:1.2rem;font-size:.6rem;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:var(--bg2);opacity:.45;cursor:pointer;z-index:201;background:0 0;border:0;padding:.5rem}
#pc:hover{opacity:.9}

/* Responsive */
@media(max-width:768px){
.tl{grid-template-columns:1fr;gap:0}
.tl::before{top:0;bottom:0;left:1rem;right:auto;width:2px;height:auto}
.ti{text-align:left;padding:1rem 0 1rem 3.25rem}
.ti::before{top:1rem;left:0;transform:none}
.ti::after{top:1.4rem;left:1rem;transform:translateX(-50%)}
}
@media(max-width:640px){
:root{--pad:1.5rem}
.bb{padding:.9rem 1.2rem}
.g3,.cols{grid-template-columns:1fr}
.g3>div:nth-child(2){transform:none}
.st{grid-template-columns:5px 1fr;gap:1.2rem}
.st::before{height:90px}
.sq blockquote{padding-left:2rem}
.sq blockquote::before{font-size:3rem}
.sq cite{padding-left:2rem}
#pg{grid-template-columns:1fr 1fr;gap:.6rem}
.pii{transform:scale(.1)}
}
@media(prefers-reduced-motion:reduce){.r{transition:opacity .2s;transform:none}}
@media print{body{overflow:visible}.sc{display:block;transform:none!important;width:auto;height:auto}.s{min-width:auto;width:100%;height:auto;min-height:100vh;page-break-after:always;overflow:visible}.s:last-child{page-break-after:auto}.r{opacity:1;transform:none}#p,.bb,#po{display:none!important}}
    </style>
</head>
<body>
<div id="p"></div>
<div class="sc" id="sc">

{{SLIDES}}

</div>
<div class="bb"><div class="bl"><button class="btn" id="sc2"><span id="cur">1</span> / <span id="tot">1</span></button><button class="btn" id="dl">↓ Pdf</button><div class="cp"><button id="cpb"></button><div id="cpd"></div></div></div><a class="tb" href="https://tana.inc" target="_blank">Created with tana.inc</a><div class="br"><span class="nh">←→ · F</span></div></div>
<div id="po"><button id="pc">Close</button><div id="pg"></div></div>
<script>
const C=['#d1086d','#a60717','#ff9100','#d48c0d','#d6ba04','#9db325','#1dbf8c','#0558ab','#0066ff','#4303a8','#8b299e','#f750d3'],
$=s=>document.getElementById(s),r=document.documentElement,
hex2rgb=(h,a)=>`rgba(${parseInt(h.slice(1,3),16)},${parseInt(h.slice(3,5),16)},${parseInt(h.slice(5,7),16)},${a})`,
setAcc=c=>{r.style.setProperty('--acc',c);r.style.setProperty('--glow',hex2rgb(c,.1));localStorage.setItem('acc',c)},
saved=localStorage.getItem('acc');if(saved&&C.includes(saved))setAcc(saved);
const sc=$('sc'),slides=[...document.querySelectorAll('.s')],prog=$('p'),cur=$('cur'),tot=$('tot'),
sc2=$('sc2'),dl=$('dl'),po=$('po'),pg=$('pg'),pc=$('pc'),cpb=$('cpb'),cpd=$('cpd');
let idx=0,pOpen=0,cOpen=0;
tot.textContent=slides.length;
const go=i=>{slides[idx].classList.remove('v');idx=i;sc.style.transform=`translateX(-${i*100}vw)`;setTimeout(()=>slides[i].classList.add('v'),50);cur.textContent=i+1;prog.style.width=`${(i+1)/slides.length*100}%`;pg.querySelectorAll('.pi').forEach((p,j)=>p.classList.toggle('cur',j===i))};
C.forEach(c=>{const s=document.createElement('button');s.className='cs'+(c===(saved||'#0066ff')?' sel':'');s.style.cssText=`background:${c};color:${c}`;s.onclick=()=>{setAcc(c);cpd.querySelectorAll('.cs').forEach(x=>x.classList.toggle('sel',x.style.background===c));pg.innerHTML='';buildPrev();cOpen=0;cpd.classList.remove('a')};cpd.appendChild(s)});
const buildPrev=()=>slides.forEach((s,i)=>{const d=document.createElement('div');d.className='pi'+(i===idx?' cur':'');d.innerHTML=`<div class="pii">${s.outerHTML}</div><span class="pin">${i+1}</span>`;d.onclick=()=>{go(i);pOpen=0;po.classList.remove('a')};pg.appendChild(d)});
buildPrev();go(0);
document.onkeydown=e=>{if(pOpen)return e.key==='Escape'&&(pOpen=0,po.classList.remove('a'));const k=e.key;if(k==='ArrowRight'||k==='ArrowDown'||k===' '||k==='PageDown'){e.preventDefault();idx<slides.length-1&&go(idx+1)}else if(k==='ArrowLeft'||k==='ArrowUp'||k==='PageUp'){e.preventDefault();idx>0&&go(idx-1)}else if(k==='Home'){e.preventDefault();go(0)}else if(k==='End'){e.preventDefault();go(slides.length-1)}else if(k==='f'||k==='F')document.fullscreenElement?document.exitFullscreen():r.requestFullscreen().catch(()=>{})};
sc2.onclick=()=>{pOpen=!pOpen;po.classList.toggle('a',pOpen)};pc.onclick=()=>{pOpen=0;po.classList.remove('a')};
po.onclick=e=>e.target===po&&(pOpen=0,po.classList.remove('a'));dl.onclick=()=>print();
cpb.onclick=e=>{e.stopPropagation();cOpen=!cOpen;cpd.classList.toggle('a',cOpen)};
document.onclick=e=>cOpen&&!cpd.contains(e.target)&&(cOpen=0,cpd.classList.remove('a'));
</script>
</body>
</html>
```

## Template Variables

Replace these when generating:

| Variable | Description |
|----------|-------------|
| `{{TITLE}}` | Presentation title for `<title>` tag |
| `{{SLIDES}}` | Generated slide HTML (each slide is a `<section class="s">`) |

## CSS Class Reference

| Class | Purpose |
|-------|---------|
| `.s` | Base slide |
| `.st` | Title slide (accent bar left) |
| `.ss` | Statement slide (centered, gradient bg) |
| `.sq` | Quote slide (large quote mark) |
| `.r` | Reveal animation element |
| `.dt` | Date tag (pill style) |
| `.g3` | Card grid (staggered, left border) |
| `.cols` | Two columns (with faded icons via `data-icon`) |
| `.tl` | Timeline container (horizontal) |
| `.ti` | Timeline item (use `data-n` for number) |
| `.sub` | Subtitle text |

## Features

| Feature | Description |
|---------|-------------|
| **Horizontal navigation** | Arrow keys, space, or swipe to navigate |
| **System theme** | Auto light/dark based on `prefers-color-scheme` |
| **Color picker** | 12 Tana supertag colors, saved to localStorage |
| **Slide preview** | Click slide counter to see thumbnail grid |
| **PDF export** | Click ↓ PDF button to print/save as PDF |
| **Fullscreen** | Press F to toggle |

## CSS Variables

| Variable | Light | Dark | Purpose |
|----------|-------|------|---------|
| `--bg` | `#f8f6f3` | `#141210` | Page background |
| `--bg2` | `#fffefa` | `#1c1a17` | Slide background |
| `--c1` | `#1a1816` | `#f5f3f0` | Headlines |
| `--c2` | `#6b635a` | `#9a928a` | Body text |
| `--acc` | `#0066ff` | `#0066ff` | Accent color (user-changeable) |
| `--glow` | `rgba(0,102,255,0.1)` | same | Glow/tint for accent |

## Tana Accent Colors

Available in the color picker:

```
#d1086d  #a60717  #ff9100  #d48c0d
#d6ba04  #9db325  #1dbf8c  #0558ab
#0066ff  #4303a8  #8b299e  #f750d3
```

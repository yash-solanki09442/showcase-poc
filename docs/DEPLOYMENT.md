# Deployment & repository strategy

## Problem (resolved by policy)

Two GitHub repos existed:

| Repo | Role |
|------|------|
| `yash-solanki09442/showcase-poc` | Development source (canonical) |
| `yash-solanki09442/showcase-website` | **Vercel-linked** deploy target |

Pushing only to `showcase-poc` did **not** update the live site. Image fixes required syncing to `showcase-website`.

---

## Decision: single source of truth

**Canonical repo:** `showcase-poc`  
**Vercel project:** `showcase-website-ochre` → should import **`showcase-poc`** (recommended)

### Option A — Reconnect Vercel (recommended)

1. Vercel dashboard → **showcase-website-ochre** → Settings → Git  
2. Disconnect `showcase-website`  
3. Import **`showcase-poc`** from GitHub  
4. Framework: **Other**, no build command, output `.`  
5. Retire or archive `showcase-website` repo

One repo, one push, live site updates automatically.

### Option B — Keep two repos (interim)

After changes in `showcase-poc`, run sync script before client demos:

```powershell
cd "C:\Users\Yash Solanki\Projects\showcase-poc"
.\scripts\sync-to-vercel-repo.ps1 -TargetPath "C:\Users\Yash Solanki\Projects\showcase-website"
cd "C:\Users\Yash Solanki\Projects\showcase-website"
git add -A
git commit -m "Sync from showcase-poc"
git push origin main
```

Clone deploy repo once:

```powershell
git clone https://github.com/yash-solanki09442/showcase-website.git "C:\Users\Yash Solanki\Projects\showcase-website"
```

---

## Files deployed (static POC)

```
index.html  shop.html  product.html  cart.html  wishlist.html
products.js  css/  js/  favicon.svg  vercel.json  404.html
```

**Not deployed:** `docs/`, `PROPOSAL.md`, `showcase-platform/` (Phase 1 lives separately)

---

## Live URL

https://showcase-website-ochre.vercel.app/

---

## Phase 1 deployment (future)

| App | Host |
|-----|------|
| Next.js (`showcase-platform/apps/web`) | Vercel Pro |
| Django API (`showcase-platform/apps/api`) | Railway / AWS |
| PostgreSQL | Managed RDS / Supabase / Neon |

See `showcase-platform/README.md`.

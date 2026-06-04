# Showcase — Client Review & Sign-Off

**Live POC:** https://showcase-website-ochre.vercel.app/  
**Proposal:** [PROPOSAL.md](../PROPOSAL.md)  
**Phase 1 scaffold:** [showcase-platform](../showcase-platform/) (separate repo folder)

---

## Executive confirmation

| Decision | Recommendation | Status |
|----------|----------------|--------|
| Production stack | **Python (Django) + PostgreSQL + Next.js** — not Shopify | Pending client sign-off |
| POC purpose | UX and journey validation only — not production code | Delivered |
| Phase 1 scope | Single-brand store: catalog, cart, checkout, accounts, admin | Pending scope workshop |

---

## POC walkthrough checklist

Use this when presenting to stakeholders.

### Brand & design

- [ ] Typography and spacing feel luxury / editorial (Cormorant + DM Sans)
- [ ] Mobile layout acceptable on phone and tablet
- [ ] USD / EUR toggle behaves as expected (display only)
- [ ] Consultation CTAs acceptable as placeholders until Phase 1

### Shopping journeys

- [ ] **Home** — hero, featured products, brand story
- [ ] **Shop** — filters (Clothing, Jewellery, Shoes, Lifestyle, Merchandise), sort
- [ ] **Product** — gallery, options, add to bag, wishlist, reviews (mock)
- [ ] **Bag** — quantity, subtotal, mock checkout message
- [ ] **Wishlist** — persist within browser session

### Explicit POC limitations (set expectations)

- [ ] No real payments or order emails
- [ ] No user accounts (Phase 1)
- [ ] Cart/wishlist clear when browser session ends (`sessionStorage`)
- [ ] Product images from Unsplash CDN — production will use owned media on S3

---

## Production direction sign-off

| Question | Client answer | Date |
|----------|---------------|------|
| Approve luxury UX direction from POC? | | |
| Confirm Python + Next.js (no Shopify)? | | |
| Phase 1 regions / currencies at launch? | | |
| Target Phase 1 launch window? | | |
| Budget range approved for Phase 1 build? | | |

---

## Next step after sign-off

1. Discovery sprint (2–3 weeks): API schema, ERD, Stripe flow, admin wireframes  
2. Build from [showcase-platform](../showcase-platform/) monorepo skeleton  
3. See [BACKEND_DECISION.md](./BACKEND_DECISION.md) for Django vs FastAPI resolution  

---

*Export this page to PDF alongside PROPOSAL.md for client pack.*

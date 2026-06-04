# Backend decision — Phase 1

**Decision:** **Django 5 + Django REST Framework** for Showcase Phase 1 API  
**Date:** June 2026  
**Supersedes:** Open choice between FastAPI and Django in PROPOSAL.md §3

---

## Context

Showcase Phase 1 requires:

- Product, variant, inventory, and category management
- Order and payment webhook handling (Stripe)
- Staff admin for catalog and fulfillment
- Foundation for Phase 2 multi-vendor and Phase 3 property listings

Both Django and FastAPI satisfy the API needs. The deciding factor for Phase 1 is **time-to-operational admin** without building a custom React admin from day one.

---

## Comparison (Phase 1 lens)

| Criterion | Django + DRF | FastAPI |
|-----------|--------------|---------|
| Admin UI for products/orders | **Django Admin — built-in** | Custom admin or SQLAdmin |
| Auth & permissions | Mature user model, groups | Roll your own / fastapi-users |
| ORM & migrations | Django ORM | SQLAlchemy + Alembic |
| Async / high-throughput APIs | Good enough for Phase 1 | Stronger native async |
| Team alignment | Matches Python preference | Matches Python preference |
| Phase 2+ microservices | Can extract services later | Easier to split early |

---

## Decision

**Use Django + DRF for Phase 1.** FastAPI remains an option for **extracted services** in Phase 2+ (search, notifications, ML recommendations) without rewriting the commerce core.

### Stack (locked for Phase 1)

```
Next.js 14 (App Router)  →  Vercel
Django 5 + DRF           →  Railway / AWS / Render
PostgreSQL 16            →  RDS or managed Postgres
Redis                    →  cache + Celery broker (Phase 1b)
S3 + CloudFront          →  product media
Stripe                   →  checkout + webhooks
```

---

## Implementation location

Monorepo: `C:\Users\Yash Solanki\Projects\showcase-platform`

- `apps/web/` — Next.js storefront (POC design tokens)
- `apps/api/` — Django project `showcase_api`

---

## When to revisit

- Phase 2 if search/notifications need dedicated async services → add FastAPI sidecar
- If admin requirements exceed Django Admin → custom React admin on Next.js, keep Django as API

**Approved by:** _Pending client sign-off (see CLIENT_REVIEW.md)_

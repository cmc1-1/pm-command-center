# Lessons Learned from Previous Roles

Hard-won wisdom from 10+ years in product and program management. Claude should reference these when I'm facing similar situations.

---

## AWS — Transform Assessment (Senior PM, Agentic AI Platform)

### What went right
- **0→1 speed matters more than perfection**: Built a multi-agent AI assessment platform from scratch, hit 400+ enterprise customers and $200M+ pipeline in under 3 months. The key was shipping an MVP fast and iterating on real feedback, not perfecting the spec.
- **LLM recommendation acceptance is a design problem, not an AI problem**: Improved acceptance rate by 60% — the model was already good enough, we just needed to present recommendations in a way that built trust (showing reasoning, allowing overrides, progressive disclosure of complexity).
- **Scaling is a process problem, not a technology problem**: Grew assessments from ~1,000 to 4,000+/year. The bottleneck was never the platform — it was intake process, consultant training, and quality standardization.

### What I'd do differently
- Would have invested in self-service analytics earlier — too much reporting was manual, creating PM bottleneck
- Should have built a stronger feedback loop from field consultants back to product — insights were getting lost in email threads
- Underestimated the political complexity of enterprise AI adoption — technical readiness ≠ organizational readiness

### Key patterns
- In enterprise: the buyer, the user, and the champion are three different people with different needs
- Platform products need a clear "paved path" that works out of the box + flexibility for power users
- Multi-agent systems require extreme clarity about which agent does what — ambiguity creates user confusion and debugging nightmares

---

## Generac Grid Services (Product Management)

### What went right
- Learned to translate complex technical systems (energy grid management) into user-friendly interfaces
- Built strong cross-functional alignment between hardware engineering, software, and field operations

### What I'd do differently
- Regulated industries move slowly — I should have planned for 2x the timeline on anything requiring utility approval
- Should have pushed harder for direct user access — too much feedback was filtered through sales

### Key patterns
- In hardware-adjacent products, deployment timelines are 10x longer than pure software. Plan accordingly.
- Field operations teams are your best source of user insight — they see what actually happens vs. what the spec says should happen

---

## Consulting (Accenture, PwC) and Program Management (Best Buy, Suncor)

### What went right
- Learned to manage stakeholders across multiple organizations with competing priorities
- Developed strong executive communication skills — learned the Pyramid Principle early
- Built program management discipline: WBS, critical path, dependency tracking, risk registers

### What I'd do differently
- Consulting teaches you to be thorough, but product management requires you to be decisive. I had to unlearn "present all options equally" and learn "recommend one option and defend it"
- Would have moved to product roles sooner — I was too comfortable in the consulting pattern

### Key patterns
- Large organizations make decisions slowly but change direction even more slowly. Once you get alignment, protect it
- The person who controls the meeting agenda controls the outcome. Always own the agenda
- Written communication scales better than verbal. If it's not written down, it didn't happen

---

## Universal Lessons (apply everywhere)

1. **Talk to users every week.** Not monthly. Not quarterly. Every single week. Even 2 conversations a week compounds into deep understanding within a month.

2. **Decisions decay without documentation.** If you don't write down why you made a decision, someone (including future-you) will question it within 3 months and you won't remember the rationale. The decision log exists for this reason.

3. **The biggest PM failure mode is building the wrong thing, not building it slowly.** Speed of shipping is meaningless if you're shipping the wrong feature. Discovery before delivery, always.

4. **Your relationship with engineering is the most important relationship you have.** If engineering doesn't trust you, nothing works. Earn trust by: being prepared, respecting their time, accepting technical constraints gracefully, and celebrating their work publicly.

5. **Strategy without trade-offs is just a wish list.** If your strategy doesn't say what you're NOT doing, it's not a strategy.

6. **Data informs decisions; it doesn't make them.** Data tells you what happened. You have to decide what to do about it. PMs who hide behind "the data says..." aren't doing their job.

7. **Surprises destroy trust.** If something is going wrong, tell stakeholders early. The forgiveness window for "I told you two weeks ago" is much wider than for "I found out yesterday."

8. **Scope is a negotiation, not a mandate.** When leadership says "we need X by Y date," the PM's job is to negotiate scope, not just accept it. "We can do the core of X by Y, or all of X by Z — which do you prefer?" is always better than "OK" followed by a miss.

9. **The best PM artifact is the one that gets used.** A perfect PRD that nobody reads is worse than a rough one-pager that engineering actually references daily. Optimize for utility, not completeness.

10. **AI is a multiplier, not a replacement.** AI handles the operational overhead — meeting notes, first drafts, data analysis, status reports. You handle the judgment — what to build, who to talk to, when to say no, how to navigate politics. The combination is exponentially powerful.

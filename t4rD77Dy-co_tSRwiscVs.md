### User Story

- In order to modify or view an existing project
- As a user
- I want to be able to clone a repository
---

### Flow Diagram

```mermaid
graph TD
    A(Current Repo URL changed) -->|Load from Browser State| B{Repo in browser?}
    B -->|Yes| restore-lfs[Restore docs from lightning-fs]
    restore-lfs --> render(Render)
    B -->|No| E[Show Init/Clone Modal]
    E[Show URL Clone/Init Modal with Credentials Slider] --> F{Clone or Init?}
    F -->|Perform Clone| G[Get Credentials]
    F -->|Perform Initialize| H[Get Credentials]
    G --> I[Clone URL to lightning-fs]
    I --> restore-lfs
```


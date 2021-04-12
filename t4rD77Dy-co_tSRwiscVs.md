### User Story

- In order to modify or view an existing project
- As a user
- I want to be able to clone a repository
---

### Flow Diagram

```mermaid
graph TD
    A(Current Repo URL changed) -->|Load from Browser State| B{Repo in browser?}
    B -->|Yes| D(Render)
    B -->|No| E[Show Init/Clone Modal]
    E[Show Clone/Init Modal] --> F{Clone or Init?}
    F -->|Clone| G[Do Clone]
    F -->|Init| H[Do Init]
```


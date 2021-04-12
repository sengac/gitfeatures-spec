
```mermaid
graph TD
    A(Start) -->|Load from Browser State| B{Repo URL in browser?}
    B -->|Yes| D(Render)
    B -->|No| E[Show Init/Clone Modal]

```

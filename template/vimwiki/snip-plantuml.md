```plantuml
@startuml
state Test {
  state entry1:comment
  state StateA:comment
  entry1 --> StateA
  StateA -> StateB
}
@enduml
```

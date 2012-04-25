service: create:
  goal: "create a new Agent module and contract"
  in:
    path: Exists
    type: 'agent', 'job', Agent
    name: String

  sideFX: "series createModule, createContract"
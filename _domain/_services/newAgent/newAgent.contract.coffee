service: 'new':
  goal: "create a new module and contract"
  in:
    path: Exists
    type: 'agent', 'job', Agent
    name: String

  sideFX: "series createModule, createContract"
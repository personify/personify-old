####Personify

Goal-Driven Agents with Contracts

Personify enables you to model software modules as Agents: autonomous, goal-oriented ([teleological](http://en.wikipedia.org/wiki/Teleology)) [Monads](http://en.wikipedia.org/wiki/Monad_(functional_programming).
Agents use [Contracts](http://en.wikipedia.org/wiki/Design_by_contract) to declare and enforce their behavior both at design-time and at runtime.  Changes to Contracts can result in side effects such as the generation or modification of Agent artifacts (services, actors and models) or a Statement of Work, for example.

Agents have only a small number of artifacts:
  * actors - the proper nouns of your system - important actors or roles
  * services - the verbs of of your user stories - immutable transformation steps
  * models - the nouns of your system 

Agents use a module system with a design inspired by [Domain-driven design](http://en.wikipedia.org/wiki/Domain-driven_design) and [Clean Code](http://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882). Agents (modules) are [fractal](http://erg4146.casaccia.enea.it/wwwerg26701/gad-pe02.htm), that is, an Agent can be composed of an arbitrary number of sub-Agents (which could be considered as an Agent's genetic code). For a demo, let's create a simple login system: **Bouncer**

We start by drafting the contract for Bouncer:

```coffeescript

#_./examples/Bouncer/Bouncer.contract.coffee_

Bouncer:
  purpose: "control User access"
  actors:  
    User: "User of an HTML5 dashboard"
  services:    
    createUser: "create a User"      
    login: "find user or @error 'Invalid User'"
```

```coffeescript

#./examples/Bouncer/_actors/User.contract.coffee

User:
  name: @string
  user: @email 
  password: @password.atleast 10
  session: @string
```

```coffeescript

#./examples/Bouncer/_services/createUser.contract.coffee

createUser:      
  in: 
    user: User
  sideFX: -> @create user #! in DB
```

```coffeescript

#./examples/Bouncer/_services/login.contract.coffee

login:
  in: 
    user: User
  out:
    user: -> @find user or @error "User not found"
```

*./examples/Bouncer/_ui/login.jade*

```HTML

#login.vbox.center

  input.text @User.user
  input.text @User.password 

  button login @click -> Bouncer.login @User
   
  #errors

  Not a member?  
    a(href=#) Sign up! @click -> @changeViewTo 'signup'

```

*./examples/Bouncer/_ui/signup.jade*

```HTML

#signup.vbox.center

    @crud @User
    button @onClick -> Bouncer.createUser @User

    #errors          

```



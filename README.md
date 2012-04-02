####Personify

Goal-Driven Agents with Contracts

Personify enables you to model software modules as Agents: autonomous, goal-oriented ([teleological](http://en.wikipedia.org/wiki/Teleology)) [Monads](http://en.wikipedia.org/wiki/Monad_(functional_programming).
Agents use [Contracts](http://en.wikipedia.org/wiki/Design_by_contract) to declare and enforce their behavior both at design-time and at runtime.  Changes to Contracts can result in side effects such as the generation or modification of Agent artifacts (services, actors and models) or a Statement of Work, for example.

Agents have only a small number of artifacts:

    * actors - the proper nouns of your system- important actors or roles
    * services - the verbs of of your user stories- immutable transformation steps
    * models - the nouns of your system 

Agents use a module system with a design inspired by [Domain-driven design](http://en.wikipedia.org/wiki/Domain-driven_design) and [Clean Code](http://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882). Agents (modules) are [fractal](http://erg4146.casaccia.enea.it/wwwerg26701/gad-pe02.htm), that is, an Agent can be composed of an arbitrary number of sub-Agents (which could be considered as the Agent's genetic code). For more in-depth theory check out the [masterclass](https://github.com/personify/personify-masterclass) or the [whitepaper](https://github.com/personify/personify-whitepaper).  Example Agents can be found in [examples](https://github.com/personify/Personify/tree/master/examples). 

For a demo, let's create a simple login system: **[Bouncer]**(https://github.com/personify/Personify/tree/master/examples/Bouncer)

We start by launching the Personify REPL:

```
me@./examples$ personify 
> new agent Bouncer
> cd Bouncer
Bouncer> ls
- Bouncer.contract.coffee
```
the REPL has created the Bouncer Agent and a contract template for it, and we've changed context to the Bouncer.

Now we can draft the Bouncer's contract:
 
*./examples/Bouncer/Bouncer.contract.coffee*

```coffeescript

Bouncer:
  purpose: "control User access"

  actors:  
    User: "User of an application"

  services:    
    signup: "create a User"      
    login: "find user or error 'Invalid User'"

  ui:
    signup: "User can signup"
    login: "User can login"
```

if we now run 'build' on the Personify REPL:

```
Bouncer> build
  building Bouncer Agent
  actors: User
  services: signup, login
  ui: signup, login
```

Personify will scaffold out Bouncer's artifacts based on the contract:

*./examples/Bouncer/_actors/User.contract.coffee*

```coffeescript

# User of an application

User:
  name: @string
  user: @email 
  password: @password.atleast 10
  session: @string
```

*./examples/Bouncer/_services/signup.contract.coffee*

```coffeescript

# create a User

signup:      
  in: 
    user: User
  sideFX: -> @create user #! in DB
```

*./examples/Bouncer/_services/login.contract.coffee*

```coffeescript

# find User

login:
  in: 
    user: User
  out:
    user: -> @find user or @error "User not found"
```

ui widgets:

*./examples/Bouncer/_ui/login.jade*

```HTML


#login.vbox.center

  #errors

  input.text @User.user
  input.text @User.password 

  button login @click -> Bouncer.login @User
   
  Not a member?  
    a(href=#) Sign up! @click -> @changeViewTo 'signup'

```

*./examples/Bouncer/_ui/signup.jade*

```HTML


#signup.vbox.center

    #errors          

    @crud @User
    button @onClick -> Bouncer.signup @User

```



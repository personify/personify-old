####Personify

Goal-Oriented Agents with Contracts

Personify allows you to model software modules as Agents: autonomous, goal-oriented [http://en.wikipedia.org/wiki/Teleology](teleological) [http://en.wikipedia.org/wiki/Monad_(functional_programming)](Monads).
Agents use [http://en.wikipedia.org/wiki/Design_by_contract](Contracts) to declare and enforce their behavior both at design-time and at runtime.
Changes to Contracts can result in side effects such as the generation or modification of Agent artifacts (services, actors and models) or a Statement of Work, for example.

Let's create a simple login system:

The Agent:

```coffeescript

#./examples/Bouncer/Bouncer.contract.coffee

Bouncer:

  purpose: "control User access"

  actors:  

    User:
      "User of an HTML5 dashboard":
        name: @string
        user: @email 
        password: @password.atleast 10
        session: @string

  services:    

    createUser:      
      in: 
        user: User
      sideFX: -> @create user #! in DB

    login:
      in: 
        user: User
      out:
        user: -> @find user or @error "User not found"
        
  client:    
    default: 'login'

```

./examples/Bouncer/_ui/login.jade

```HTML

#login.vbox.center

  input.text @User.user
  input.text @User.password 

  button login @click -> Bouncer.login @User
   
  #errors

  Not a member?  
    a(href=#) Sign up! @click -> @changeViewTo 'signup'

```

./examples/Bouncer/_ui/signup.jade

```HTML

#signup.vbox.center

    @crud @User
    button @onClick -> Bouncer.createUser @User

    #errors          

```



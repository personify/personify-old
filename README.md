####Personify

Goal-Oriented Agents with Contracts

Personify allows you to model software modules as Agents: autonomous, goal-oriented (telegoic) Monads.
Agents use Contracts to declare and enforce their behavior both at design-time and at runtime.
Changes to Contracts can result in the generation of Agent artifacts such as services and models or even a Statement of Work

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
```coffeescript

#login.vbox.center

  input @User.user
  input @User.password 

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



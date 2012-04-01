####Personify

Goal-Oriented Agents with Contracts

Personify allows you to model software modules as Agents: autonomous, goal-oriented (telegoic) Monads.
Agents use Contracts to declare and enforce their behavior both at design-time and at runtime.
Changes to Contracts can result in the generation of Agent artifacts such as services and models or even a Statement of Work

Let's create a simple login system:

The Agent:


```coffeescript

#~/apps/Bouncer/Bouncer.contract.coffee

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
        
```

```coffeescript

  client:
    
    default:
      login:
        'vbox.center':
          1: User.user
          2: User.password 
          3: @button onClick: -> Bouncer.login User
          4: @errors
          5: "Not a member? " + @link 'Sign up!', onClick: -> @changeViewTo 'signup'
 
    signup:
      'vbox.center':
        1: User
        2: @button onClick -> Bouncer.createUser User
          
```



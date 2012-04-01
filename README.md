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
      name: string
      user: email 
      password: password.atleast 5 
      session: string

  services:    

    createUser:      
      in: 
        user: User
      sideFX: 
        @create user

    login:
      in: 
        user: User
      out:
        user: @find user 
          
```



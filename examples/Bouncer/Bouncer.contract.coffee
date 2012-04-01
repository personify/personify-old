# Bouncer Agent contract

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

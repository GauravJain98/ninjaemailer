# Ninja Emailer

Task for full stack internship at coding ninjas
## Setup

```
bundle install
bin/rails server
```

## Credentials

### Admin

```
username:admin@codingninjas.com
password:admin
```

### Agents

```
username:agent@codingninjas.com
password:agent
```

```
username:agent2@codingninjas.com
password:agent
```

## Flow

### Add new ticket/comment by user

go to localhost:3000/tickets/new

Each user will have one unique ticket

If new user a new ticket will be formed for the said user else a comment will be added in the users previous ticket once they submit this form

### Assign an agent to the ticket

Login from the admin,click on 'edit' for the ticket that does not have an assignment and assign the agent

### Monitor Chat

Admin can monitor chats of agent by clicking on 'show' for the required ticket

### Reply to an ticket

Login from the required agent, click on show and add the comment wanted. This comment can be sent to the user using an SMTP server(is not being sent right now)


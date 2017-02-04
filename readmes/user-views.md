## Views ##

--New user form__

```html
<container class='registration'>

  <%= erb :'_error' %>

  <form class="new-user-form" method="post" action="/users">
    <label>Username:</label><br>
    <input id="first-name" type="text" name="user[username]" /><br>
    <label>Email:</label><br>
    <input id="email" type="email" name="user[email]" /><br>
    <label>Password:</label><br>
    <input id="password" type="password" name="user[password]" /><br>
    <input type="submit" value="submit"/>
  </form>
  
</container>
```

__New session form__

```html
<container class='login'>

  <%= erb :'_error' %>

  <form class="login-form" method="post" action="/sessions">
    <label>Email or Username:</label><br>
    <input id="email" type="email" name="email" /><br>
    <label>Password:</label><br>
    <input id="password" type="password" name="password" /><br>
    <input type="submit" value="submit"/>
  </form>
</container>
```

__Nav for layout__

```html
<header>
  <nav class="nav-bar">
    <% if current_user %>
      <a href="/">home</a>
      <form class="button-link" method="post" action="/sessions">
          <input type="hidden" name="_method" value="delete">
          <button id="logout-button" type="submit">Logout</button>
      </form>
    <% else %>
      <a href="/sessions/new">login</a>
      <a href="/users/new">register</a>
    <% end %>
  </nav>
</header>
```


__Error views__

```html
<% if @errors %>
  <% @errors.each do |error| %>
    <span class="error"><%= error %></span>
  <% end %>
<% end %>
```

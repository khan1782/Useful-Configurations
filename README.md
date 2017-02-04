# Useful-Configurations


__________________________________________________________________
### ERB snippets

__HTML delete form__
formdelete-*tab*
```html
<form action="$1" method="post">
 <input type="hidden" name="_method" value="delete">
 ${4:<input type="${2:text}" name="$3">}
 <input type="submit" value="${5:submit}">
 </form>
```

__End Ruby Interpolation__
end-*tab*
```html
<% end %>

```
__HTML Embedded Ruby__
er-*tab*
```html
<% $0 %>
```
__________________________________________________________________
### Sinatra Migration Snippets

__create migration table__
create_table-*tab*
```ruby   
create_table :${1:plural} do |t|
	t.${2:string} :${3:column}${4:, {null: false\}}
	t.${5:string} :${6:column}${7:, {null: false\}}
	${11:t.${8:string} :${9:column}, ${10:{null: false\}}}
	${15:t.${12:string} :${13:column}, ${14:{null: false\}}}
	t.timestamps
end
```


__________________________________________________________________
### Sinatra Controller Snippets 

__delete http request
delete-*tab*
```ruby
delete '/' do
  $1
 end
```



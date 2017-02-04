# Useful-Configurations
### ERB snippets

### Sinatra Migration Snippets
#### create migration table
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

### Sinatra Controller Snippets 
delete http request
```ruby

```

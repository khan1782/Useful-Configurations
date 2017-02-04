# Useful-Snippets


__________________________________________________________________
### ERB snippets
__HTML Form for Post Request__
	formpost-*tab*
	```html
	<form action="$1" method="post">
		<input type="${2:text}:" name="$3">
		<input type="${4:text}:" name="$5">
		${8:<input type="${6:text}:" name="$7">}
		${11:<input type="${9:text}:" name="$10">}
		<input type="submit" value="${12:submit}">
	</form>
	```

__HTML Form for Delete Request__
	formdelete-*tab*
	```html
	<form action="$1" method="post">
		<input type="hidden" name="_method" value="delete">
		${4:<input type="${2:text}" name="$3">}
		<input type="submit" value="${5:submit}">
 	</form>
	```
	
__HTML Form for Put Request__
	formput-*tab*
	```html
	<form action="$1" method="post">
		<input type="hidden" name="_method" value="put">
		<input type="${2:text}:" name="$3">
		<input type="submit" value="${4:submit}">
	</form>
	```

__HTML Embedded Ruby__
	er-*tab*
	```html
	<% $0 %>
	```
__HTML Display Embedded Ruby__
	pe-*tab*
	```html
	<%= $0 %>
	```
	
__End Ruby Interpolation__
	end-*tab*
	```html
	<% end %>
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
__GET HTTP REQUEST__
	get-*tab*
	```ruby
	get '/$1' do
  		$2
	end
	```

__GET HTTP Request for Index__
	getindex-*tab*
	```ruby
	get '/${1:entries}' do
  		$3
		erb :'${1:entries}/${2:index}'
	end
	```
	
__GET HTTP Request for Show__
	getshow-*tab*
	```ruby
	get '/${1:entries}/${2:entry}_id' do
		$4
		erb :'${1:entries}/${3:show}'
	end
	```
	
__GET HTTP Request for Show *Embedded*__
	getshow2-*tab*
	```ruby
	get '/${1:entries}/${2:entry}_id/${3:articles}/${4:article}_id' do
  		$6
		erb :'${3:articles}/${5:show}'
	end
	```
__Post HTTP Request__
	post-*tab*
	```ruby
	post '/${1:entries}' do 
		$2
	end
	```

__Delete HTTP Request__
	delete-*tab*
	```ruby
	delete '/' do
	  $1
	 end
	```
__Good Looking Display Puts for Server Info__
	tput-*tab*
	```ruby
	############################
	 puts "*" * `tput cols`.chomp.to_i
	 puts ""
	 puts ""
	 puts "-" * (((`tput cols`.chomp.to_i)/2)-10) + "LOOK OVER HERE" + "-" * (((`tput cols`.chomp.to_i)/2)-10)
	 puts ""
	 p $1
	 ${3:p $2}
	 puts ""
	 puts "-" * `tput cols`.chomp.to_i
	 puts ""
	 puts ""
	 puts "*" * `tput cols`.chomp.to_i
	 ############################
	```



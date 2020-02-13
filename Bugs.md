## Bugs
## When signing up a user
Problem
```
undefined method `password_changed?' for #<User:0x00007faf4b4e30e8> Did you mean? password_digest_changed?
Extracted source (around line #33):
31
32
33
34
35
36
              

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else

```
Fix
- `changed` this `validates_presence_of :password_confirmation, if: :password_changed?` to this `validates_presence_of :password_confirmation, if: :password_digest_changed?`

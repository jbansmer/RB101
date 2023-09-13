# What will happen when 'greeting' is called:

if false
  greeting = "hello world"
end

greeting

# 'nil' will be returned because the if statement is evaluated as truthy,
# meaning greeting never gets assigned a reference value.
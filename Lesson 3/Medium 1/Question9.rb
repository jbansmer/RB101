def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# predict the output of:
bar(foo)

# 'no'. The method 'foo' returns 'yes', which is the argument for the method 'bar'. The logic of 'bar' states
# that if param is 'no' to return 'yes', otherwise 'no'.
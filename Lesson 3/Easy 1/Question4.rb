# Predict the following outputs:
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)
p numbers
# [1, 3, 4, 5] => the deletion occurs at index number 1, deleting the number 2

numbers = [1, 2, 3, 4, 5]
numbers.delete(1)
p numbers
# [2, 3, 4, 5] => the deletion occurs at the given value, deleting the number 1

### Python Quiz 1

#### 1. What is the output of the following code?
x = 10
if x > 5:
  print("Greater")
else:
  print("Smaller")

- Smaller
- Greater
- Error
- None

#### 2. What is the output of the following code?
num = 4

if num > 0:
  print(num, "is positive.")

if num % 2 == 0:
  print(num, "is divisible by 2.")
else:
  print(num, "is not divisible by 2.")

- 4 is positive.
- 4 is not divisible by 2.
- 4 is divisible by 2.
- Both A and C

#### 3. What is the output?
nums = [3, 6, 9]

for n in nums:
  print(n * 2)

- 3 6 9
- 6 12 18
- 9 36 81
- Error

#### 4. Which of the following is NOT valid syntax?
- if age > 18:
- elif age == 18:
- else:
- else if age < 18:

#### 5. How many times will this loop run?
for i in range(0, 10, 2):
  print(i)

- 10
- 5
- 2
- Infinite

---
### Python Quiz 2

#### 1. What is the output of the following code?
for i in range(5):   if i == 2:     continue   print(i)
* 0 1 2 3 4
* 0 1 3 4
* 1 2 3 4
* 0 2 3 4
  
#### 2. What is the output?
for i in range(3):   pass print("Done")
* 0 1 2 Done
* pass pass pass Done
* Done
* Nothing

#### 3. What is the output of this code?
for i in range(5):   if i == 3:     break   print(i)
* 0 1 2 3
* 0 1 2
* 1 2 3 4
* 0 1 2 3 4

#### 4. Which loop is best when the number of iterations is unknown?
* for loop
* while loop
* range loop
* None of them

#### 5. What will be the output?
i = 1 while i < 4:   print(i)   i += 1
* 1 2 3
* 1 2 3 4
* 0 1 2 3

---

### Python Quiz 1 Answer

#### 1. What is the output of the following code?
x = 10
if x > 5:
  print("Greater")
else:
  print("Smaller")

- Greater


#### 2. What is the output of the following code?
num = 4

if num > 0:
  print(num, "is positive.")

if num % 2 == 0:
  print(num, "is divisible by 2.")
else:
  print(num, "is not divisible by 2.")

- Both A and C

#### 3. What is the output?
nums = [3, 6, 9]

for n in nums:
  print(n * 2)

- 6 12 18

#### 4. Which of the following is NOT valid syntax?
- else if age < 18:

#### 5. How many times will this loop run?
for i in range(0, 10, 2):
  print(i)

- 5



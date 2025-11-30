# Test: give a test item and show message
give @s minecraft:gold_ingot 1
tellraw @s ["",{"text":"[ABC Template - Test] ","color":"gold","bold":true},{"text":"test_give executed","color":"green"}]

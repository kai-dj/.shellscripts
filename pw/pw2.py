import time
from pynput.keyboard import Key, Controller

keyboard = Controller()

time.sleep(0.2)
keyboard.press(Key.shift)
time.sleep(0.1)
keyboard.press('a')
keyboard.release('a')
time.sleep(0.1)
keyboard.release(Key.shift)
keyboard.type('pple')

keyboard.press(Key.shift)
time.sleep(0.1)
keyboard.press('S')
keyboard.release('S')
time.sleep(0.1)
keyboard.release(Key.shift)
keyboard.type('tinkt')

keyboard.press(Key.shift)
time.sleep(0.1)
keyboard.press('S')
keyboard.release('S')
time.sleep(0.1)
keyboard.release(Key.shift)
keyboard.type('ehr')

keyboard.type('1')

keyboard.press(Key.shift)
time.sleep(0.1)
keyboard.press('1')
keyboard.release('1')
time.sleep(0.1)
keyboard.release(Key.shift)

keyboard.press(Key.shift)
time.sleep(0.1)
keyboard.press('1')
keyboard.release('1')
time.sleep(0.1)
keyboard.release(Key.shift)

keyboard.press(Key.shift)
time.sleep(0.1)
keyboard.press('1')
keyboard.release('1')
time.sleep(0.1)
keyboard.release(Key.shift)

keyboard.press(Key.shift)
time.sleep(0.1)
keyboard.press('1')
keyboard.release('1')
time.sleep(0.1)
keyboard.release(Key.shift)
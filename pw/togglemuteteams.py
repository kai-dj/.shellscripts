import time
from pynput.keyboard import Key, Controller

keyboard = Controller()

keyboard.press(Key.ctrl)
keyboard.press(Key.shift)
keyboard.press('m')
time.sleep(0.1)
keyboard.release(Key.ctrl)
keyboard.release(Key.shift)
keyboard.release('m')
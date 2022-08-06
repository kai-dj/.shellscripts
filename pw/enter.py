import time
from pynput.keyboard import Key, Controller

keyboard = Controller()

keyboard.press(Key.enter)
time.sleep(0.1)
keyboard.release(Key.enter)
import time
import board
from adafruit_lsm6ds.lsm6ds3trc import LSM6DS3TRC as LSM6DS
from adafruit_lis3mdl import LIS3MDL

# Create sensor object, communicating over the board's default I2C bus
i2c = board.STEMMA_I2C()  # For using the built-in STEMMA QT connector on a microcontroller

accel_gyro = LSM6DS(i2c)
mag = LIS3MDL(i2c)

# Main loop will read values and print them out over serial.
while True:
    gyro = accel_gyro.gyro
    acceleration = accel_gyro.acceleration
    magnetic = mag.magnetic

    line = "G: {0:8.4f}, {1:8.4f}, {2:8.4f} ".format(*gyro) + "A: {0:8.4f}, {1:8.4f}, {2:8.4f} ".format(*acceleration) + "M: {0:8.4f}, {1:8.4f}, {2:8.4f}".format(*magnetic)

    print(line)
    time.sleep(0.05)

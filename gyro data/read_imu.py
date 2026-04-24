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
    acceleration = accel_gyro.acceleration
    gyro = accel_gyro.gyro
    magnetic = mag.magnetic
    print("Accel: X:{0:8.3f}, Y:{1:8.3f}, Z:{2:8.3f} m/s^2".format(*acceleration))
    print("Gyro:  X:{0:8.3f}, Y:{1:8.3f}, Z:{2:8.3f} rad/s".format(*gyro))
    print("Mag:   X:{0:8.3f}, Y:{1:8.3f}, Z:{2:8.3f} uT".format(*magnetic))
    print("")
    time.sleep(0.05)

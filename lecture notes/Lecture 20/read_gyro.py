import time
import board
from adafruit_lsm6ds.lsm6ds3trc import LSM6DS3TRC as LSM6DS

# Create sensor object, communicating over the board's default I2C bus
i2c = board.STEMMA_I2C()  # For using the built-in STEMMA QT connector on a microcontroller

accel_gyro = LSM6DS(i2c)

# Main loop will read values and print them out over serial.
while True:
    # Read gyroscope
    gyro_x, gyro_y, gyro_z = accel_gyro.gyro
    # Print values.
    print(f"{gyro_x:0.5f},{gyro_y:0.5f},{gyro_z:0.5f}")
    # Delay
    time.sleep(0.05)

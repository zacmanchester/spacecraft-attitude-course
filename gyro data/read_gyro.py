import time
import board
import adafruit_lsm9ds1

# Create sensor object, communicating over the board's default I2C bus
i2c = board.STEMMA_I2C()  # For using the built-in STEMMA QT connector on a microcontroller
sensor = adafruit_lsm9ds1.LSM9DS1_I2C(i2c)

# Main loop will read values and print them out over serial.
while True:
    # Read gyroscope
    gyro_x, gyro_y, gyro_z = sensor.gyro
    # Print values.
    print(f"{gyro_x:0.4f},{gyro_y:0.4f},{gyro_z:0.4f}")
    # Delay
    time.sleep(0.05)

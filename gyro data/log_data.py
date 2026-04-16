import serial
import time

# Configuration
serial_port = '/dev/tty.usbmodem1101' #fill this in with correct port
baud_rate = 9600
output_file = 'gyro_data.txt'

try:
    # Open the serial port
    with serial.Serial(serial_port, baud_rate, timeout=1) as ser, \
         open(output_file, 'a', encoding='utf-8') as f:
        
        print(f"Connected to {serial_port}. Logging to {output_file}...")
        
        while True:
            if ser.in_waiting > 0:
                # Read data until a newline character is found
                line = ser.readline().decode('utf-8').rstrip()
                
                if line:
                    timestamp = time.strftime("%Y-%m-%d %H:%M:%S")
                    formatted_line = f"{timestamp} - {line}\n"
                    
                    print(formatted_line, end="") # Print to console
                    f.write(formatted_line)       # Write to file
                    f.flush()                     # Ensure data is saved immediately
                    
except serial.SerialException as e:
    print(f"Error: {e}")
except KeyboardInterrupt:
    print("\nLogging stopped by user.")

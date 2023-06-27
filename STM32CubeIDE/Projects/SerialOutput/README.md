# Serial Output

# Contents
- [Serial Output](#serial-output)
- [Contents](#contents)
- [Introduction](#introduction)
- [Project](#project)
  - [Peripheral Setup](#peripheral-setup)
  - [Printing Data](#printing-data)

# Introduction

This project is a simple example of how to use the serial output on the STM32L4R5ZI board. As this board has a built-in debugger, this allows us to use the serial output without any additional hardware. To output we need to use UART (Universal Asynchronous Receiver/Transmitter). This allows us to send data back and forth between the board and our computer, this is extremely useful for debugging and for displaying information without the need for an external screen.

# Project

Feel free to download this project and import it into STM32CubeIDE. If you are unsure how to do this, please refer to the [STM32CubeIDE importing projects]().

Alternatively you can create a new project and follow the steps below. When creating a project ensure to initialize the peripherals with default settings when prompted.

## Peripheral Setup

To start using the UART we need to set it up correctly. Open the .ioc configuration file and navigate to the `Connectivity` tab. Here we can enable the UART peripheral.

![Connectivity](./Images/ConnectivityTab.png)

Next we need to configure the UART peripheral. To do this click on `LPUART1` (Low Power UART). In the `Parameter Settings` tab we can configure the UART peripheral. Set the options to the same as below:

![UART Settings](./Images/LPUART1Conf.png)

Save the configuration and allow it to generate the necessary code.

## Printing Data

Now that we have the correct UART device set-up we can start looking at some code.

To output we can use the function provided by the HAL (Hardware Abstraction Layer)

```c
HAL_UART_Transmit(&UART_DEVICE, data, sizeof(data), delay);
```

This function takes 4 arguments:
- A reference to the UART device we want to use
- A pointer to the data we want to send
- The size of the data we want to send
- Timeout duration

In our case we can send a simple string forever with a time delay of 1 second.

```c
char data[] = "Hello World!!!\r\n";
HAL_UART_Transmit(&hlpuart1, data, sizeof(data), 100);
HAL_Delay(1000);
```

Put the above code into the main loop after `/* USER CODE BEGIN 3 */` to preserve it after code generation.

Now compile and run the code onto the board. To actually see the output we will need a serial monitor. STM32CubeIDE has one built-in but it is not very easy to use. I recommend using [Putty](https://www.putty.org/).

Open up Putty, you now need to enter the COM port of the board and the speed. To find the COM port your board is using open the device manager and look under `Ports (COM & LPT)`. The COM port should be listed as `STMicroelectronics STLink Virtual COM Port`.

![COM Port](./Images/COM_PORT.png)

In my case this is COM4, it will most likely be *different* for you.

Now enter this into putty along with the speed of 115200. Ensure to select `Serial` as the connection type.

![Putty](./Images/Putty.png)

Now click `Open` and you should see the output from the board.

![Output](./Images/Output.png)
# Keil Studio Cloud

# Contents
- [Keil Studio Cloud](#keil-studio-cloud)
- [Contents](#contents)
- [What is this?](#what-is-this)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
  - [IDE](#ide)
    - [Select Your Board](#select-your-board)
    - [Create a New Project](#create-a-new-project)
  - [Flash an LED](#flash-an-led)
    - [Compile and Run](#compile-and-run)

# What is this?

Keil Studio Cloud is a web based IDE that allows for the creation, running and debugging of embedded applications. It runs ARM Mbed OS which is an open source operating system for microcontrollers. It is a great tool for beginners as it does not require any installation and is very easy to use.

# Prerequisites

To use Keil Studio Cloud you will need the following:
- Basic knowledge of C++
- Basic knowledge of embedded systems
- An internet connection
- A STM32L4R5ZI Nucleo board
- Optionally an understanding of the ARM Mbed OS
- Optionally an understanding of ARM assembly

Throughout this tutorial I will be using Google Chrome, however any modern browser should work.

# Getting Started

Getting started is extremely easy. Simply head to the [Mbed site](https://os.mbed.com/account/login/) and create a free account. Once you have done this, you will be able to access the Keil Studio Cloud IDE.

## IDE

To access the IDE follow this link: [Keil Studio Cloud](https://studio.keil.arm.com/auth/login/). It may ask you to log in again, use the account you just created to gain access. You will then be greeted with the following screen:

![Keil Studio Cloud](./Images/KeilStudioCloud.png)

### Select Your Board

So that Keil Studio knows what libraries to use and what board to compile for, you will need to select your board.

1. Click Build Target selection.
2. Select your board from the list, in our case this will be `NUCLEO-L4R5ZI`.

![Select Board](./Images/BoardSelector.png)

### Create a New Project

To create a new project simply go to `File` -> `New` -> `Mbed Project`. You will then be asked to name your project and select an example project to use. For this tutorial we will be using an empty project.

![Create Project](./Images/CreateProject.png)

Ensure that the option `Make this the active project` is selected and click `Add Project`.

Creating the project can take some time depending on your internet connection. Once it has finished you will be able to see your project in the project explorer.

![Project Explorer](./Images/MyFirstProject.png)

## Flash an LED

To check if our board is working correctly we will flash the blue on-board LED. To do this we will need to write some basic code.

1. Open the `main.cpp` file in the project explorer.
2. Above the `main` function add the following code:


    ```cpp
    DigitalOut blueLED(LED2);
    ```

3. In the `main` function, within the `while` loop, add the following code:

    ```cpp
    blueLED.write(!blueLED);
    ThisThread::sleep_for(500ms);
    ```

This is basic code to set up a pin to output, we then toggle the pin every 500ms. This will cause the LED to flash.

### Compile and Run

1. Connect your board to your computer using the appropriate USB cable. Ensure to use the USB port labelled `USB PWR`.

    ![USB Port](./Images/PWR_USB.jpg)

2. Now click on the `Connected Device` window.

    ![Connected Device](./Images/ConnectedDevice.png)

3. Now click on `Add Device`and select `STM32 STLink`.

    ![Add Device](./Images/AddDevice.png)

4. Return to the project explorer you should now see that your device is connected successfully.

    ![Device Connected](./Images/DeviceConnected.png)

5. Now we can compile and run our code. Click on the `Run` button. This will build and flash our project onto the microcontroller. This process can take some time depending on your internet connection.

    ![Run](./Images/Run.png)

6. Once the code has been flashed onto the board, the LED should start flashing.

    ![LED Flashing](./Images/LEDFlashing.gif)

You have now successfully flashed your first program onto the board.
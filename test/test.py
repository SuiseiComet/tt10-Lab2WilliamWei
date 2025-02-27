# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    dut._log.info("Test project behavior")


    dut.ui_in.value = 0b00000000
    dut.uio_in.value = 0b00000001

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 0

    dut.ui_in.value = 0b00000000
    dut.uio_in.value = 0b00000011

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 1

    dut.ui_in.value = 0b00000000
    dut.uio_in.value = 0b00000111

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 2

    dut.ui_in.value = 0b00000000
    dut.uio_in.value = 0b0001111

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 3

    dut.ui_in.value = 0b00000000
    dut.uio_in.value = 0b00011111

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 4

    dut.ui_in.value = 0b00000000
    dut.uio_in.value = 0b00110101

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 5

    dut.ui_in.value = 0b00000000
    dut.uio_in.value = 0b01110101

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 6

    dut.ui_in.value = 0b00000000
    dut.uio_in.value = 0b01110101

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 6

    dut.ui_in.value = 0b00000000
    dut.uio_in.value = 0b11110101

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 7

    dut.ui_in.value = 0b00000001
    dut.uio_in.value = 0b11110101

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 8

    dut.ui_in.value = 0b00000011
    dut.uio_in.value = 0b01010011

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 9

    dut.ui_in.value = 0b00000111
    dut.uio_in.value = 0b01110101

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 10

    dut.ui_in.value = 0b00001111
    dut.uio_in.value = 0b01110101

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 11

    dut.ui_in.value = 0b00011111
    dut.uio_in.value = 0b01110101

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 12

    dut.ui_in.value = 0b00101010
    dut.uio_in.value = 0b11110001

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 13

    dut.ui_in.value = 0b01101010
    dut.uio_in.value = 0b01110101

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 14
    
    dut.ui_in.value = 0b10000000
    dut.uio_in.value = 0b01110101

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 15



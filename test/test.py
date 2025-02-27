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


    dut.ui_in.value = 0b00101010
    dut.uio_in.value = 0b11110001

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 13

    dut.ui_in.value = 0b00000000
    dut.uio_in.value = 0b00000001

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 0

    dut.ui_in.value = 0b00000000
    dut.uio_in.value = 0b00000000

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 0b11110000

    dut.ui_in.value = 0b00000010
    dut.uio_in.value = 0b01010011

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 9

    dut.ui_in.value = 0b00000000
    dut.uio_in.value = 0b00101011

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 5

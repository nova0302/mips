VLIB = $(shell which vlib)
VLOG = $(shell which vlog)
VSIM = $(shell which vsim)

WORK = work

VLOG_OPTIONS = -sv -lint -y $(VDIR) +libext+.sv +incdir+$(VDIR) +define+RTL_SIM
VSIM_OPTIONS = -novopt -c -do "run -all; quit"

VDIR =./../../rtl/verilog
VSRCS =$(wildcard $(VDIR)/*.sv)

DUT  = led_test
TB   = $(DUT)_tb

all: vlib com sim

vlib:
#	@if [ -d $(WORK) ]; then vdel -lib $(WORK) && vlib $(WORK); fi
	@if [ ! -d $(WORK) ]; then vlib $(WORK); fi

com:
	vlog $(VLOG_OPTIONS) -work $(WORK) $(VDIR)/$(TB).sv
#	$(VLOG) $(VLOG_OPTIONS) -f vlog.args

sim:
	vsim $(VSIM_OPTIONS) $(WORK).$(TB)

clean:
	rm -rf $(WORK) transcript *.wlf

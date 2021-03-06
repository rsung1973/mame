CPUS["Z80"] = true

SOUNDS["SN76496"] = true

VIDEOS["TMS9928A"] = true

BUSES["COLECO"] = true

function createProjects(_target, _subtarget)
	project ("tiny")
	targetsubdir(_target .."_" .. _subtarget)
	kind "StaticLib"
	uuid (os.uuid("drv-mess-tiny"))
	
	options {
		"ForceCPP",
	}
	
	includedirs {
		MAME_DIR .. "src/emu",
		MAME_DIR .. "src/mess",
		MAME_DIR .. "src/lib",
		MAME_DIR .. "src/lib/util",
		MAME_DIR .. "3rdparty",
		MAME_DIR .. "3rdparty/zlib",
		GEN_DIR  .. "mess/layout",
	}	

	includeosd()

	files{
		MAME_DIR .. "src/mess/drivers/coleco.c",
		MAME_DIR .. "src/mess/machine/coleco.c",
	}
end

function linkProjects(_target, _subtarget)
	links {
		"tiny",
	}
end
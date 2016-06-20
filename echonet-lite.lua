-- ########################################################
-- ECHONET Lite Wireshark dissector
-- ########################################################
--
--   Author : Yuki MIZUNO
--   Version: 0.0.1
--   License: MIT
--
-- ########################################################
--
--  Copyright (c) 2016 Yuki MIZUNO
--  This software is released under the MIT License.
--  http://opensource.org/licenses/MIT
--

echonetlite = Proto("echonet-lite", "ECHONET Lite")

-- ========================================================
-- ECHONET Lite UDP payload fields definition.
-- ========================================================

echonetlite.fields.ehd1 = ProtoField.uint8("echonetlite.ehd1",  "EHD1", base.HEX)
echonetlite.fields.ehd2 = ProtoField.uint8("echonetlite.ehd2",  "EHD2", base.HEX)
echonetlite.fields.tid  = ProtoField.uint16("echonetlite.tid",  "TID",  base.HEX)
echonetlite.fields.seoj = ProtoField.uint24("echonetlite.seoj", "SEOJ", base.HEX)
echonetlite.fields.deoj = ProtoField.uint24("echonetlite.deoj", "DEOJ", base.HEX)
echonetlite.fields.esv  = ProtoField.uint8("echonetlite.esv",   "ESV",  base.HEX)

-- ========================================================
-- Parse ECHONET Lite UDP payload fields.
-- ========================================================

function echonetlite.dissector(buffer, pinfo, tree)
    pinfo.cols.protocol = "ECHONET Lite"
end

-- ========================================================
-- Register ECHONET Lite protocol to UDP port 3610
-- ========================================================

udp_table = DissectorTable.get("udp.port")
udp_table:add("3610", echonetlite)

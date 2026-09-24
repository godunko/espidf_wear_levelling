--
--  Copyright (C) 2026, Vadim Godunko
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

with ESPIDF.Ada_ESP_Check_Error;

package body ESPIDF.Wear_Levelling is

   --------------
   -- wl_mount --
   --------------

   procedure wl_mount
     (partition  : ESPIDF.Partition.esp_partition_t;
      out_handle : out wl_handle_t) is
   begin
      Ada_ESP_Check_Error (wl_mount (partition, out_handle));
   end wl_mount;

end ESPIDF.Wear_Levelling;

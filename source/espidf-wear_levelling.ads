--
--  Copyright (C) 2026, Vadim Godunko
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

with ESPIDF.Partition;

package ESPIDF.Wear_Levelling is

   type wl_handle_t is private;

   WL_INVALID_HANDLE : constant wl_handle_t;

   function wl_mount
     (partition  : ESPIDF.Partition.esp_partition_t;
      out_handle : out wl_handle_t) return ESPIDF.esp_err_t
     with Import, Convention => C, External_Name => "wl_mount";

   procedure wl_mount
     (partition  : ESPIDF.Partition.esp_partition_t;
      out_handle : out wl_handle_t);

private

   type wl_handle_t is record
      Value : int32_t := -1;
   end record with Convention => C, Size => int32_t'Size;

   WL_INVALID_HANDLE : constant wl_handle_t := (Value => -1);

end ESPIDF.Wear_Levelling;

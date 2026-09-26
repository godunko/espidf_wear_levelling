--
--  Copyright (C) 2026, Vadim Godunko
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

with ESPIDF.Partition;

package ESPIDF.Wear_Levelling is

   type wl_handle_t is private;
   --  Wear levelling handle.

   WL_INVALID_HANDLE : constant wl_handle_t;

   function wl_mount
     (partition  : ESPIDF.Partition.esp_partition_t;
      out_handle : out wl_handle_t) return ESPIDF.esp_err_t
     with Import, Convention => C, External_Name => "wl_mount";
   --  Mount WL for defined partition.
   --  @param partition Partition that will be used for access
   --  @param out_handle Handle of the WL instance
   --  @return
   --    - `ESP_OK` if the WL allocation is successful
   --    - `ESP_ERR_INVALID_ARG` if the arguments for WL configuration are
   --      not valid
   --    - `ESP_ERR_NO_MEM` if the WL allocation fails because of
   --      insufficient memory

   procedure wl_mount
     (partition  : ESPIDF.Partition.esp_partition_t;
      out_handle : out wl_handle_t);
   --  Mount WL for defined partition.
   --  @param partition Partition that will be used for access
   --  @param out_handle Handle of the WL instance
   --  @raise ESPIDF_Error raised on error:
   --    - `ESP_ERR_INVALID_ARG` if the arguments for WL configuration are
   --      not valid
   --    - `ESP_ERR_NO_MEM` if the WL allocation fails because of
   --      insufficient memory

private

   type wl_handle_t is new int32_t with Convention => C, Default_Value => -1;

   WL_INVALID_HANDLE : constant wl_handle_t := -1;

end ESPIDF.Wear_Levelling;

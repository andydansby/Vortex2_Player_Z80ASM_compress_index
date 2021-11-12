# Vortex2_Player_Z80ASM_compress_index

This is natural continuation of Vortex2_Player_Z80ASM_compress

We now have several songs loaded into memory.  The Buffer has been reduced to 4k, so don't load songs
longer than that (4096 bytes) without changing the buffer.  

Of course changing the buffer size means loading fewer songs as we are limited by memory size in RAM 0.
So please adjust carefully.  A 4k song is a pretty decent length

For the songs, I randomily downloaded several songs for testing all were plesant to listen to.

All songs are (C) by their respected authors.

Songs include
august melancholy by Pator
WaL'sOk.. Hi DiHaLT ViZitOrZz by MmcM
fu(n)cked up! by scalesmann^mc

To change song index, adjust the a register in UNCOMP_SONG.  That line is commented beforehand and after with ;which song to play

enjoy.

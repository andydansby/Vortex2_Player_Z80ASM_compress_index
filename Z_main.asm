;Test codes (commented)
;Entry and other points
;START initialize playing of module at MDLADDR
;START+3 initialization with module address in HL
;START+5 play one quark
;START+8 mute
;START+10 setup and status flags
;START+11 current position value (byte) (optional)

;START
;	LD HL,MDLADDR	;START
;	JR INIT			;START+3
;	JP PLAY			;START+5
;	JR MUTE			;START+8
;SETUP	DB 0 		;START+10
;CurPos	DB 0 		;START+11
	SECTION MAIN
	ORG 0x8000


lockandload:	


	call UNCOMP_SONG
	
	ld hl, BUFFER_UNCOMP
	;ld hl, song1
	
	LD A,2	
    LD (START+10),A
    CALL START+3	
    EI

_LP:
	HALT
	
	CALL START+5	
	XOR A	;test keyboard	
	IN A,($FE)	
	CPL	
	AND 15	
	JR Z, _LP
	
	JP START+8	
ret
	
; ZX0 Parameters:
; HL: source address (compressed data)
; DE: destination address (decompressing)
UNCOMP_SONG:
	ld hl, TABLA_SONG_CMP
	;;;;;;;;;;;;;
	;which song to play
	ld a, 0; song number index starts at 0
	;;;;;;;;;;;;;
	call EXT_WORD
	ld de, BUFFER_UNCOMP
	call dzx0_standard
	ret	

;EXTRACT A WORD FROM A TABLE
;IN:(HL)=ADDRESS TABLE
;   (A)= POSITION
;OUT(HL)=WORD
EXT_WORD:
    LD D,0
	RLCA
	LD E,A
	ADD HL,DE
	LD E,(HL)
	INC HL
	LD D,(HL)
	EX DE,HL
	RET
;----------------------------------

SECTION PTZX_Player
ORG 0xC000

	include "Z_PTZX.asm"
BUFFER_UNCOMP:
	defs $1000	;defs $1522
; Space for the largest pt3 file

TABLA_SONG_CMP:
	defw	song1, song2


; *** Songs ***
song1:
    binary "songs\MmcM.zx0"

song2:
    binary "songs\Pator.zx0"
	
song3:
    binary "songs\Scalesmann.zx0"

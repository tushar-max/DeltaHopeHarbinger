--Sealed Duel
--credits to andre and AlphaKretin, tag functionality by senpaizuri, rescripted by MLD
--re-rescripted by edo9300
local selfs={}
if self_table then
	function self_table.initial_effect(c) table.insert(selfs,c) end
end
local id=511005092
if self_code then id=self_code end
if not SealedDuel then
	SealedDuel={}
	local function finish_setup() 
		--Pre-draw
		local e1=Effect.GlobalEffect()
		e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		e1:SetCode(EVENT_STARTUP)
		e1:SetCountLimit(1)
		e1:SetOperation(SealedDuel.op)
		Duel.RegisterEffect(e1,0)
	end
	--define pack
	--pack[1]=BP01, [2]=BP02, [3]=BPW2, [4]=BP03
	--[1]=rare, [2]=common, [3]=foil
	pack={}
		pack[1]={}
		pack[1][1]={
			78010363,34124316,77585513,79575620,89111398,61370518,40737112,25551951,4929256,88753985,83104731,
			12538374,85520851,44330098,73125233,79473793,17559367,9748752,59575539,98777036,10000000,5556499,
			10802915,84013237,10002346,47506081,69610924,68597372,31386180,94119480,71594310,12580477,72302403,
			55144522,18144506,79571449,4031928,19613556,45986603,70828912,68005187,73915051,56747793,31036355,
			44947065,98645731,41420027,44095762,97077563,83555666,53582587,26905245,82732705,49010598,77538567
		}
		pack[1][2]={
			61831093,93920745,1347977,74131780,45141844,71413901,48343627,21502796,91133740,66788016,79759861,
			40619825,5318639,64047146,19230407,7165085,14087893,71453557,34236961,61127349,24874630,56460688,
			98045062,43040603,30683373,6178850,25789292,83584898,27243130,6430659,73178098,37390589,60082869,
			59744639,59344077,62279055,29267084,98239899,38411870,37576645,54704216,38275183,36261276,94192409,
			66518841,15552258,73729209,46502013,24673894,50078509,79161790,21636650,53656677,87106146,72022087,
			11091375,49881766,79182538,13179332,35052053,69247929,78193831,78658564,40133511,88472456,78636495,
			53982768,49681811,18036057,2134346,63749102,53839837,42386471,83986578,40659562,46363422,51945556,
			70074904,51838385,14778250,90810762,16956455,CARD_CYBER_DRAGON,59023523,85306040,78700060,77252217,85087012,
			93151201,20546916,39303359,61802346,78651105,51196174,37955049,60953118,83269557,17573739,70050374,
			44223284,23927545,59042331,12235475,95637655,41224658,7025445,4694209,94215860,62476815,51254277,
			12299841,12076263,33225925,41098335,53540729,13039848,28933734,33508719,46657337,26302522,65240384,
			45894482,52860176,43586926,21593977,47025270,16268841,1434352,3510565,2671330,11448373,16226786,
			88975532,87621407,18325492,71218746,29216198,83982270,33695750,31034919,30312361,3657444,14089428,
			7736719,14506878,15658249,95360850,97021916,45620686,47217354,66288028,40225398,97385276,57421866,
			55099248,19665973,53162898,89567993,68473226,14785765,15394083,86952477,26082117,25259669
		}
		pack[1][3]={}
		for _,v in ipairs(pack[1][1]) do table.insert(pack[1][3],v) end
		for _,v in ipairs(pack[1][2]) do table.insert(pack[1][3],v) end
		pack[2]={}
		pack[2][1]={
			6631034,31560081,34124316,66362965,79575620,7572887,40737112,68007326,78636495,70074904,83104731,
			15894048,85520851,81919143,58554959,61538782,3657444,40921744,33655493,83269557,49879995,59575539,
			5645210,8483333,78651105,79473793,19028307,85028288,55690251,97940434,55758589,45812361,36088082,
			21954587,10532969,61231400,83764718,55144522,70828912,79571449,48712195,98645731,33904024,81000306,
			97077563,37576645,42671151,60080151,6691855
		}
		pack[2][2]={
			11091375,69247929,43096270,93013676,78658564,31709826,88240808,40133511,45894482,88472456,8131171,
			18036057,43586926,47025270,90790253,16268841,2671330,22609617,4041838,88975532,15960641,65240384,
			42386471,16956455,18325492,44729197,71218746,CARD_CYBER_DRAGON,85306040,63749102,55424270,12538374,99861526,
			85087012,48115277,93187568,18430390,4906301,66337215,39303359,64262809,26376390,78700060,13893596,
			95360850,97021916,14778250,33420078,96938777,20546916,61802346,33695750,15341821,66288028,40225398,
			59042331,4694209,96872283,19665973,42280216,64926005,7025445,58324930,41098335,15394083,84914462,
			40619741,14785765,97896503,62476815,56223084,2584136,65367484,25206027,52823314,1281505,38679204,
			74064212,86039057,12423762,66499018,64892035,33911264,19700943,82593786,18988391,42969214,66200210,
			52097679,40619825,99597615,70046172,64047146,73915051,14087893,58577036,71453557,61127349,34016756,
			32022366,98045062,82828051,55713623,12923641,58775978,80921533,24874630,60399954,6178850,67196946,
			25789292,91580102,27863269,73048641,98867329,19578592,27243130,22346472,73178098,17418744,96864811,
			77622396,12607053,22359980,68540058,57882509,93382620,59744639,83133491,21597117,28649820,43250041,
			66742250,66526672,36361633,78211862,96008713,12117532,13955608,30643162,60306104,86871614,60406591,
			26905245,79852326,34815282,97151365,71272951,37390589,66518841,80987696,15552258,97168905,73729209,
			53656677,87106146,21636650,6799227,3129635,49514333,86778566,44046281,78474168
		}
		pack[2][3]={
			10000000,10000010,10000020
		}
		for _,v in ipairs(pack[2][1]) do table.insert(pack[2][3],v) end
		for _,v in ipairs(pack[2][2]) do table.insert(pack[2][3],v) end
		pack[3]={}
		pack[3][1]={
			13945283,62340868,51534754,25773409,59380081,52323207,53828396,76763417,2158562,50287060,99747800,
			22624373,18489208,68722455,11613567,98954375,20351153,72328962,81275309,2137678,43359262,95905259,
			5244497,49374988,40921545,83274244,30811116,79759861,56830749,22046459,70231910,56460688,47453433,
			25774450,98847704,59560625,62325062,77538567,42793609,89792713,11741041,75987257,22869904
		}
		pack[3][2]={
			77542832,16768387,39751093,87523462,39978267,39168895,56647086,39507162,95701283,54749427,23303072,
			41753322,88650530,84932271,88494899,96146814,69529567,45801022,6903857,43332022,98649372,47349310,
			20193924,56410040,79972330,8814959,9861795,8649148,61132951,44682448,80208158,5284653,4058065,
			67922702,4417407,54635862,6930746,83225447,65169794,34664411,43422537,37534148,52497105,70344351,
			38411870,90669991,74458486,31000575,18271561,85352446,49204190,73632127,71098407,63630268,94156050
		}
		pack[3][3]={}
		pack[4]={}
		pack[4][1]={
			42364374,71413901,82108372,39168895,78636495,42386471,16956455,85306040,89222931,85087012,18430390,
			61802346,39303359,54040221,52319752,14089428,76203291,75081613,96235275,41113025,6061630,92826944,
			84847656,74976215,69695704,45041488,12435193,80925836,42463414,77135531,10321588,4694209,39037517,
			37792478,49680980,82199284,20474741,83957459,66816282,91438994,62950604,47013502,85682655,4611269,
			95905259,1371589,66499018,64892035,40921545,98225108,42969214,97396380,89362180,15767889,50896944
		}
		pack[4][2]={
			23635815,40133511,38742075,77491079,40320754,30914564,76909279,2671330,18325492,55424270,3370104,
			93130021,21074344,94689635,99861526,79409334,12398280,20586572,46508640,95943058,91596726,52035300,
			87685879,39180960,59797187,11232355,17266660,52430902,38041940,2525268,95090813,71759912,90508760,
			43426903,65422840,79337169,3603242,23927545,20351153,13521194,12235475,96930127,2137678,84747429,
			73625877,93830681,5237827,2584136,49374988,72429240,7914843,30464153,78663366,30608985,54635862,
			37984162,61318483,12467005,99733359,25727454,72302403,70046172,86198326,70828912,82432018,19230407,
			73915051,95281259,55991637,81385346,37684215,31036355,2204140,4861205,10012614,28106077,98045062,
			82828051,12923641,36045450,37534148,1353770,6178850,4230620,62991886,99995595,35480699,45247637,
			32180819,44887817,92346415,25789292,95507060,91580102,25518020,66835946,98867329,84428023,78082039,
			27243130,67775894,60398723,53610653,89882100,88616795,73199638,36042825,96864811,83438826,23562407,
			42502956,54773234,52112003,88610708,97077563,22359980,68540058,57882509,41925941,31785398,80163754,
			98239899,3149764,59744639,83133491,29267084,66742250,12503902,96008713,77538567,4923662,60306104,
			93895605,34815282,82633308,23323812,59718521,37390589,91078716,54451023,97168905,73729209,17490535,
			43889633,16678947,87106146,32854013,21636650,89792713,3146695,25642998,11741041,75987257,44046281,
			78474168,44509898,71098407,63630268,23122036,25005816,51099515,88494120,14883228,50277973,87772572
		}
		pack[4][3]={
			47506081,95992081,11411223,47805931,3989465,76372778,581014,12014404,48009503,74593218,57043117,
			95169481,66506689,51960178,80764541,75367227,68836428
		}
		for _,v in ipairs(pack[4][1]) do table.insert(pack[4][3],v) end
		for _,v in ipairs(pack[4][2]) do table.insert(pack[4][3],v) end
	local namechange={
		--0 - alternate art, 1 - anime/vg/illegal counterpart
		[78010363]={ [1]={78010363,511003012}; };
		[40737112]={ [1]={40737112,511001039}; };
		[79473793]={ [1]={79473793,511001784}; };
		[10000000]={ [0]={10000000,10000001,10000002}; [1]={10000000,10000001,10000002,110000011,110000011}; };
		[84013237]={ [1]={84013237,511002599}; };
		[69610924]={ [1]={69610924,511002077}; };
		[18144506]={ [0]={18144506,18144507}; };
		[97077563]={ [1]={97077563,511002048}; };
		[83555666]={ [0]={83555666,83555667}; [1]={83555666,83555667,511000824,511000825}; };
		[26905245]={ [1]={26905245,511009214}; };
		[21502796]={ [1]={21502796,511003007}; };
		[19230407]={ [0]={19230407,19230408}; };
		[24874630]={ [1]={24874630,511001596}; };
		[98045062]={ [1]={98045062,511000604}; };
		[37390589]={ [0]={37390589,37390590}; };
		[36261276]={ [1]={36261276,511002539}; };
		[72022087]={ [1]={72022087,511002574}; };
		[78193831]={ [0]={78193831,78193832}; };
		[CARD_CYBER_DRAGON]={ [0]={CARD_CYBER_DRAGON,70095155}; };
		[78700060]={ [1]={78700060,511002514}; };
		[37955049]={ [1]={37955049,511002642}; };
		[51254277]={ [1]={51254277,511001766}; };
		[41098335]={ [1]={41098335,511001396}; };
		[26302522]={ [1]={26302522,511002509}; };
		[65240384]={ [1]={65240384,511001595}; };
		[45894482]={ [1]={45894482,511003006}; };
		[43586926]={ [1]={43586926,511000868}; };
		[30312361]={ [1]={30312361,511001926}; };
		[3657444]={ [1]={3657444,511002464}; };
		[14785765]={ [1]={14785765,511001961}; };
		[15894048]={ [1]={15894048,511003009}; };
		[8483333]={ [1]={8483333,511002425}; };
		[55690251]={ [1]={55690251,511002277}; };
		[45812361]={ [1]={45812361,511001770}; };
		[83764718]={ [1]={83764718,83764719}; };
		[8131171]={ [1]={8131171,511000818}; };
		[26376390]={ [1]={26376390,511002387}; };
		[13893596]={ [1]={13893596,511000243}; };
		[96938777]={ [1]={96938777,511002641}; };
		[65367484]={ [1]={65367484,511002816}; };
		[34016756]={ [1]={34016756,511000474}; };
		[55713623]={ [1]={55713623,511002777}; };
		[12923641]={ [1]={12923641,511003008}; };
		[80921533]={ [1]={80921533,511756002}; };
		[68540058]={ [0]={68540058,68540059}; [1]={68540058,68540059,511006005}; };
		[12117532]={ [1]={12117532,511002814}; };
		[13955608]={ [1]={13955608,511003022,511015121}; };
		[86871614]={ [1]={86871614,511600007}; };
		[79852326]={ [1]={79852326,511000212}; };
		[97168905]={ [1]={97168905,511002911}; };
		[10000010]={ [0]={10000010,10000011}; [1]={10000010,10000011,110000010,110000010}; };
		[10000020]={ [0]={10000020,10000021,10000022}; [1]={10000020,10000021,10000022,110000012,110000012}; };
		[62340868]={ [1]={62340868,511002508}; };
		[2158562]={ [1]={2158562,511001598}; };
		[68722455]={ [1]={68722455,511002263}; };
		[2137678]={ [1]={2137678,511002529}; };
		[39507162]={ [1]={39507162,511019009}; };
		[98649372]={ [1]={98649372,810000029}; };
		[44682448]={ [1]={44682448,344000000}; };
		[74458486]={ [1]={74458486,511002057}; };
		[18271561]={ [1]={18271561,511002541}; };
		[92826944]={ [1]={92826944,511002370}; };
		[10321588]={ [1]={10321588,511018014}; };
		[3370104]={ [1]={3370104,511007022}; };
		[65422840]={ [1]={65422840,511002265}; };
		[36045450]={ [1]={36045450,511600006,511600005}; };
		[1353770]={ [1]={1353770,511002321}; };
		[42502956]={ [1]={42502956,511001622}; };
		[4923662]={ [1]={4923662,511002837}; };
		[25642998]={ [1]={25642998,810000019}; };
		[11411223]={ [1]={11411223,511010010}; };
		[47805931]={ [1]={47805931,511010020}; };
		[80764541]={ [1]={80764541,511001997}; };
		
	}
	function SealedDuel.alternate(code,anime)
		local chk=anime and 1 or 0
		if not namechange[code] or not namechange[code][chk] then return code end
		local num=Duel.GetRandomNumber(1,#namechange[code][chk])
		return namechange[code][chk][num]
	end
	function SealedDuel.op(e,tp,eg,ep,ev,re,r,rp)
		for _,card in ipairs(selfs) do
			Duel.SendtoDeck(card,0,-2,REASON_RULE)
		end
		local counts={}
		counts[0]=Duel.GetPlayersCount(0)
		counts[1]=Duel.GetPlayersCount(1)
		Duel.DisableShuffleCheck()
		Duel.Hint(HINT_CARD,0,id)
		--tag variable defining
		local z,o=tp,1-tp
		if not aux.AskEveryone(aux.Stringid(4006,9)) then
			return
		end
		--pack selection
		local pack1=Duel.CreateToken(0,511003041)
		local pack2=Duel.CreateToken(0,511003042)
		local pack3=Duel.CreateToken(0,511003043)
		local pack4=Duel.CreateToken(0,511003044)
		selectpack={}

		-- pack select
		local sg=Group.FromCards(pack1,pack2,pack3,pack4):Select(tp,1,4,nil)
		-- Duel.Hint(HINT_MESSAGE,1-tp,1211)
		
		--pack checking
		selectpack[1]=sg:IsContains(pack1)
		selectpack[2]=sg:IsContains(pack2)
		selectpack[3]=sg:IsContains(pack3)
		selectpack[4]=sg:IsContains(pack4)
		if selectpack[3] and not selectpack[1] and not selectpack[2] and not selectpack[4] then
			selectpack[2]=true
		end
		
		--treat as all monster types
		if Duel.SelectYesNo(tp,aux.Stringid(4009,0)) then
			Duel.Hint(HINT_OPSELECTED,tp,aux.Stringid(4009,0)) 
			local getrc=Card.GetRace
			Card.GetRace=function(c)
				if c:IsType(TYPE_MONSTER) then return 0xfffffff end
				return getrc(c)
			end
			local getorigrc=Card.GetOriginalRace
			Card.GetOriginalRace=function(c)
				if c:IsType(TYPE_MONSTER) then return 0xfffffff end
				return getorigrc(c)
			end
			local getprevrc=Card.GetPreviousRaceOnField
			Card.GetPreviousRaceOnField=function(c)
				if (c:GetPreviousTypeOnField()&TYPE_MONSTER)~=0 then return 0xfffffff end
				return getprevrc(c)
			end
			local isrc=Card.IsRace
			Card.IsRace=function(c,r)
				if c:IsType(TYPE_MONSTER) then return true end
				return isrc(c,r)
			end
		end
		--anime counterparts select
		anime=aux.AskAny(aux.Stringid(4006,15))
			
		--anime counterparts
		local groups={}
		groups[0]={}
		groups[1]={}
		for i=1,counts[0] do
			groups[0][i]={}
		end
		for i=1,counts[1] do
			groups[1][i]={}
		end
		
		for p=z,o do
			for team=1,counts[p] do
				for i=1,9 do
					local g=Group.CreateGroup()
					local packnum=0
					--random set among selected sets
					repeat
						packnum=Duel.GetRandomNumber(1,4)
					until selectpack[packnum]
					for i=1,5 do
						local rarity
						if i==1 then
							rarity=1
						elseif i<5 then
							rarity=2
						else
							rarity=3
						end
						local code
						if rarity==3 and packnum==3 then
							local tempn=3
							repeat
								tempn=Duel.GetRandomNumber(1,4)
							until tempn~=3 and selectpack[tempn]
							code=pack[tempn][3][Duel.GetRandomNumber(1,#pack[tempn][3])]
						else
							code=pack[packnum][rarity][Duel.GetRandomNumber(1,#pack[packnum][rarity])]
						end
						local finalcode=SealedDuel.alternate(code,anime)
						-- g:AddCard(Duel.CreateToken(p,finalcode))
						table.insert(groups[p][team],finalcode)
					end
				end
			end
		end
		
		for p=z,o do
			for team=1,counts[p] do
				local handcnt=Duel.GetFieldGroupCount(p,LOCATION_HAND,0)
				Duel.SendtoDeck(Duel.GetFieldGroup(p,0xff,0),nil,-2,REASON_RULE)
				for idx,code in ipairs(groups[p][team]) do
					local loc=LOCATION_DECK
					-- if idx<=handcnt then loc=LOCATION_HAND end
					Debug.AddCard(code,p,p,LOCATION_DECK,1,POS_FACEDOWN)
				end
				Debug.ReloadFieldEnd()
				Duel.Hint(HINT_SELECTMSG,p,aux.Stringid(4002,7))
				local fg=Duel.GetFieldGroup(p,LOCATION_DECK+LOCATION_HAND,0)
				Duel.SendtoDeck(fg:Select(p,0,#fg-20,nil),nil,-2,REASON_RULE)
				local edg=Duel.GetFieldGroup(p,LOCATION_EXTRA,0)
				if #edg>0 then Duel.ConfirmCards(p,edg) end
				if handcnt>0 then Duel.Draw(tp,handcnt,REASON_RULE) end
				if counts[p]~=1 then
					Duel.TagSwap(p)
				end
			end
		end
	end
	finish_setup()
end

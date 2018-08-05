#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: // STATE 1 - Diner1.pml:32 - [((proc<5))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((P1 *)this)->proc<5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - Diner1.pml:33 - [(run philosopher(proc))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!(addproc(II, 1, 0, ((P1 *)this)->proc)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - Diner1.pml:33 - [proc = (proc+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->proc;
		((P1 *)this)->proc = (((P1 *)this)->proc+1);
#ifdef VAR_RANGES
		logval(":init::proc", ((P1 *)this)->proc);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 4 - Diner1.pml:34 - [((proc>=5))] (0:0:1 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (!((((P1 *)this)->proc>=5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: proc */  (trpt+1)->bup.oval = ((P1 *)this)->proc;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->proc = 0;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 9 - Diner1.pml:37 - [-end-] (0:0:0 - 3)
		IfNotBlocked
		reached[1][9] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC philosopher */
	case 8: // STATE 1 - Diner1.pml:15 - [((fork[right]==FREE))] (18:0:3 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((now.fork[ Index(((P0 *)this)->right, 5) ]==2)))
			continue;
		/* merge: fork[right] = BUSY(18, 2, 18) */
		reached[0][2] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = now.fork[ Index(((P0 *)this)->right, 5) ];
		now.fork[ Index(((P0 *)this)->right, 5) ] = 1;
#ifdef VAR_RANGES
		logval("fork[philosopher:right]", now.fork[ Index(((P0 *)this)->right, 5) ]);
#endif
		;
		/* merge: .(goto)(18, 4, 18) */
		reached[0][4] = 1;
		;
		/* merge: state = HUNGRY(18, 6, 18) */
		reached[0][6] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->state;
		((P0 *)this)->state = 3;
#ifdef VAR_RANGES
		logval("philosopher:state", ((P0 *)this)->state);
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: state */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->state = 0;
		_m = 3; goto P999; /* 3 */
	case 9: // STATE 7 - Diner1.pml:21 - [((fork[left]==BUSY))] (19:0:1 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		if (!((now.fork[ Index(((P0 *)this)->left, 5) ]==1)))
			continue;
		/* merge: fork[right] = FREE(19, 8, 19) */
		reached[0][8] = 1;
		(trpt+1)->bup.oval = now.fork[ Index(((P0 *)this)->right, 5) ];
		now.fork[ Index(((P0 *)this)->right, 5) ] = 2;
#ifdef VAR_RANGES
		logval("fork[philosopher:right]", now.fork[ Index(((P0 *)this)->right, 5) ]);
#endif
		;
		/* merge: .(goto)(19, 17, 19) */
		reached[0][17] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 10: // STATE 17 - Diner1.pml:24 - [.(goto)] (0:19:0 - 2)
		IfNotBlocked
		reached[0][17] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 10 - Diner1.pml:22 - [fork[left] = BUSY] (0:19:7 - 1)
		IfNotBlocked
		reached[0][10] = 1;
		(trpt+1)->bup.ovals = grab_ints(7);
		(trpt+1)->bup.ovals[0] = now.fork[ Index(((P0 *)this)->left, 5) ];
		now.fork[ Index(((P0 *)this)->left, 5) ] = 1;
#ifdef VAR_RANGES
		logval("fork[philosopher:left]", now.fork[ Index(((P0 *)this)->left, 5) ]);
#endif
		;
		/* merge: state = EATING(19, 11, 19) */
		reached[0][11] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->state;
		((P0 *)this)->state = 5;
#ifdef VAR_RANGES
		logval("philosopher:state", ((P0 *)this)->state);
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: state */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->state = 0;
		/* merge: printf('Philosopher%d is eating.\\n',id)(19, 12, 19) */
		reached[0][12] = 1;
		Printf("Philosopher%d is eating.\n", ((P0 *)this)->id);
		/* merge: fork[left] = FREE(19, 13, 19) */
		reached[0][13] = 1;
		(trpt+1)->bup.ovals[2] = now.fork[ Index(((P0 *)this)->left, 5) ];
		now.fork[ Index(((P0 *)this)->left, 5) ] = 2;
#ifdef VAR_RANGES
		logval("fork[philosopher:left]", now.fork[ Index(((P0 *)this)->left, 5) ]);
#endif
		;
		/* merge: fork[right] = FREE(19, 14, 19) */
		reached[0][14] = 1;
		(trpt+1)->bup.ovals[3] = now.fork[ Index(((P0 *)this)->right, 5) ];
		now.fork[ Index(((P0 *)this)->right, 5) ] = 2;
#ifdef VAR_RANGES
		logval("fork[philosopher:right]", now.fork[ Index(((P0 *)this)->right, 5) ]);
#endif
		;
		/* merge: state = THINKING(19, 15, 19) */
		reached[0][15] = 1;
		(trpt+1)->bup.ovals[4] = ((P0 *)this)->state;
		((P0 *)this)->state = 4;
#ifdef VAR_RANGES
		logval("philosopher:state", ((P0 *)this)->state);
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: state */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->state = 0;
		/* merge: .(goto)(19, 17, 19) */
		reached[0][17] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 12: // STATE 23 - Diner1.pml:27 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][23] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}


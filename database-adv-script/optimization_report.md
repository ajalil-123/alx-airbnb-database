# before optimization

# -> Nested loop inner join  (cost=1.11 rows=2) (actual time=4.78..4.79 rows=2 loops=1)
#    -> Left hash join (pay.booking_id = b.booking_id)  (cost=0.656 rows=2) (actual time=4.18..4.19 rows=2 loops=1)
 #       -> Inner hash join (b.property_id = p.property_id)  (cost=1.12 rows=2) (actual time=0.469..0.476 rows=2 loops=1)
 #           -> Table scan on b  (cost=0.185 rows=2) (actual time=0.0605..0.0642 rows=2 loops=1)
 #           -> Hash
 #               -> Table scan on p  (cost=0.45 rows=2) (actual time=0.0637..0.0806 rows=2 loops=1)
 #       -> Hash
 #           -> Table scan on pay  (cost=0.185 rows=1) (actual time=3.59..3.62 rows=1 loops=1)
  #  -> Single-row index lookup on u using PRIMARY (user_id=b.user_id)  (cost=0.175 rows=1) (actual time=0.183..0.184 rows=1 loops=2)



# after optimization

# -> Nested loop inner join  (cost=1.08 rows=2) (actual time=0.643..0.657 rows=2 loops=1)
#    -> Left hash join (pay.booking_id = b.booking_id)  (cost=0.633 rows=2) (actual time=0.487..0.494 rows=2 loops=1)

 #       -> Inner hash join (b.property_id = p.property_id)  (cost=1.1 rows=2) (actual time=0.128..0.134 rows=2 loops=1)
 #           -> Table scan on b  (cost=0.177 rows=2) (actual time=0.0658..0.0696 rows=2 loops=1)
  #          -> Hash
  #              -> Table scan on p  (cost=0.45 rows=2) (actual time=0.0227..0.0261 rows=2 loops=1)
  #      -> Hash
   #         -> Table scan on pay  (cost=0.178 rows=1) (actual time=0.0632..0.0704 rows=1 loops=1)
  #  -> Single-row index lookup on u using PRIMARY (user_id=b.user_id)  (cost=0.175 rows=1) (actual time=0.0172..0.0173 rows=1 loops=2)

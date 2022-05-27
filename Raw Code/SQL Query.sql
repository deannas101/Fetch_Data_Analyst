--I made a database where I imported the three CSV files - for simplicity on this exercise,
--I imported all columns as nvarchar(MAX) except for receipts.dateScanned which was imported 
--as a datetime

--each month will need to be highlited and executed separately

----Here's the rankings for Feb '21
with
	cte (receiptId, dateScanned, brandName)
	as
	(
		select
			receiptId,
			dateScanned,
			name

		from (
			select 
				r.receiptId,
				r.dateScanned,
				b.name
			from receipts r
			full outer join brands b on b.cpgId = r.rewardsProductPartnerId
		) t1

		union

		select
			receiptId,
			dateScanned,
			name

		from (
			select 
				r.receiptId,
				r.dateScanned,
				b.name
			from receipts r
			full outer join brands b on b.brandCode = r.brandCode
		) t2

		union

		select
			receiptId,
			dateScanned,
				name

		from (
			select 
				r.receiptId,
				r.dateScanned,
				b.name
			from receipts r
			full outer join brands b on b.cpgId = r.pointsPayerId
		) t3
	)

select
	brandName as 'Brand Name',
	count(distinct receiptId) as 'Number of Receipts'

from cte
where dateScanned between '2021-02-01' and '2021-03-01'

group by brandName
order by count(distinct receiptId) desc



----Here's the rankings for Jan '21
with
	cte (receiptId, dateScanned, brandName)
	as
	(
		select
			receiptId,
			dateScanned,
			name

		from (
			select 
				r.receiptId,
				r.dateScanned,
				b.name
			from receipts r
			full outer join brands b on b.cpgId = r.rewardsProductPartnerId
		) t1

		union

		select
			receiptId,
			dateScanned,
			name

		from (
			select 
				r.receiptId,
				r.dateScanned,
				b.name
			from receipts r
			full outer join brands b on b.brandCode = r.brandCode
		) t2

		union

		select
			receiptId,
			dateScanned,
				name

		from (
			select 
				r.receiptId,
				r.dateScanned,
				b.name
			from receipts r
			full outer join brands b on b.cpgId = r.pointsPayerId
		) t3
	)

select
	brandName as 'Brand Name',
	count(distinct receiptId) as 'Number of Receipts'

from cte
where dateScanned between '2021-01-01' and '2021-02-01'

group by brandName
order by count(distinct receiptId) desc